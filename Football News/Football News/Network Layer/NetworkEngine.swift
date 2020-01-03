//
//  NetworkLayer.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol NetworkEngine {}

extension NetworkEngine {
    typealias fetchedData<T>    =   (_ objects: [T]?) -> ()
    typealias downloadedImage   =   (_ image: UIImage?) -> ()
    typealias failure           =   (_ message: String) -> ()
    
    /// Function to fetch all objects from a specific node in firebase
    ///
    /// - Parameters:
    ///   - node: Firebase node to fetch objects from
    ///   - observerType: Data Event Type observer for the node
    ///   - decodedData: completion handler for Fetched Data and decoded data from firebase
    func addFirebaseObserver<T: Codable>(node: String, observerType: DataEventType, onSuccess: @escaping fetchedData<T>, onFailure: @escaping failure) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node).observe(observerType, with: { dataSnapshot in
            if dataSnapshot.value != nil {
                for snap in dataSnapshot.children.allObjects {
                    let value       = snap as! DataSnapshot
                    if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any) {
                        do {
                            let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                            objects.append(object)
                        } catch {
                            print(error)
                        }
                    } else {
                        print("Object not decoded")
                    }
                }
                onSuccess(objects)
            } else {
                onFailure("No Data Recieved")
            }
        }, withCancel: { error in
            onFailure(error.localizedDescription)
        })
    }
    
    /// Function to fetch a specific number of objects from a specific node in firebase
    ///
    /// - Parameters:
    ///   - noOfobjects: number of objects to fetch
    ///   - node: Firebase node to fetch objects from
    ///   - observerType: Data Event Type observer for the node
    ///   - decodedData: completion handler for Fetched Data and decoded data from firebase
    func getInitialObjects<T: Codable>(noOfobjects: UInt, node: String, observerType: DataEventType, onSuccess: @escaping fetchedData<T>, onFailure: @escaping failure) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node)
        .queryOrdered(byChild: "key")
        .queryLimited(toFirst: noOfobjects)
        .observe(observerType, with: { dataSnapshot in
            if dataSnapshot.value  != nil {
                for snap in dataSnapshot.children.allObjects {
                    let value       = snap as! DataSnapshot
                    if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any) {
                        do {
                            let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                            objects.append(object)
                        } catch {
                            print(error)
                        }
                    } else {
                        print("Object not decoded")
                    }
                }
                onSuccess(objects)
            } else {
                onFailure("No Data Recieved")
            }
        }, withCancel: { error in
            onFailure(error.localizedDescription)
        })
        
    }

    /// Function to fetch a specific number of objects in a range from specific node in firebase
    ///
    /// - Parameters:
    ///   - startValue: range start value
    ///   - endValue: range end value
    ///   - node: Firebase node to fetch objects from
    ///   - observerType: Data Event Type observer for the node
    ///   - decodedData: completion handler for Fetched Data and decoded data from firebase
    func paginatedFirebaseObserver<T: Codable>(startValue: String, endValue: String, node: String, observerType: DataEventType, decodedData: @escaping fetchedData<T>, onFailure: @escaping failure) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node)
        .queryOrdered(byChild: "key")
        .queryStarting(atValue: startValue)
        .queryEnding(atValue: endValue)
        .queryLimited(toFirst: 10)
        .observeSingleEvent(of: observerType, with: { dataSnapshot in
            if dataSnapshot.value  != nil {
                for snap in dataSnapshot.children.allObjects {
                    let value       = snap as! DataSnapshot
                    if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any) {
                        do {
                            let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                            objects.append(object)
                        } catch {
                            print(error)
                        }
                    } else {
                        print("Object not decoded")
                    }
                }
                decodedData(objects)
            } else {
                onFailure("No Data Recieved")
            }
        }, withCancel: { error in
            onFailure(error.localizedDescription)
        })
    }
    
    /// Function to download images from a given URL and save them in cache
    ///
    /// - Parameters:
    ///   - imageUrl: URL of the image
    ///   - image: completion handler for downloaded image
    func downloadImage(imageUrl: URL, onSuccess: @escaping downloadedImage, onFailure: @escaping failure) {
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let data = data {
                if let downloadedImage = UIImage(data: data) {
                    FNCacheManager.shared.imageCache.setObject(downloadedImage, forKey: imageUrl.absoluteString as NSString)
                    DispatchQueue.main.async {
                        onSuccess(downloadedImage)
                    }
                } else {
                    onFailure("Image not downloaded")
                }
            }
        }
        dataTask.resume()
    }
    
    /// Function to return downloaded images if already in cache else download them
    ///
    /// - Parameters:
    ///   - imageUrl: URL of the image
    ///   - image: completion handler for downloaded image or image returned from cache
    func getImage(imageUrl: URL, onSuccess: @escaping downloadedImage, onFailure: @escaping failure) {
        if let cachedImage = FNCacheManager.shared.imageCache.object(forKey: imageUrl.absoluteString as NSString) {
            onSuccess(cachedImage)
        } else {
            downloadImage(imageUrl: imageUrl, onSuccess: onSuccess, onFailure: onFailure)
        }
    }
    
    /// Function to get objects from an API
    ///
    /// - Parameters:
    ///   - url: URL of the API
    ///   - onSuccess: completion handler for the objects fetched
    func getCities<T: Codable>(url: URL, onSuccess: @escaping fetchedData<T>, onFailure: @escaping failure) {
        let session     =  URLSession.shared
        let dataTask    =  session.dataTask(with: url) { data, response, error in
            if let data =  data {
                do {
                    let fetchedObjects = try JSONDecoder().decode([T].self, from: data)
                    onSuccess(fetchedObjects)
                } catch {
                    print(error)
                }
            } else {
                onFailure("No Data Recieved")
            }
        }
        dataTask.resume()
    }
}
