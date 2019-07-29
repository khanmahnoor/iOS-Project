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
    // MARK: data fetching functions
    func addFirebaseObserver<T : Codable>(node : String, observerType : DataEventType, decodedData : @escaping (_  objects : [T]?) -> ()) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node).observe(observerType, with: { (dataSnapshot) in
            if dataSnapshot.value != nil {
                for snap in dataSnapshot.children.allObjects {
                    let value = snap as! DataSnapshot
                    if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any){
                        print(jsonData)
                        do {
                            let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                            objects.append(object)
                        } catch {
                            print(error)
                        }
                    }
                }
                decodedData(objects)
            }
            decodedData(objects)
        }, withCancel: {Error in
            print (Error)
            // pass through to appropriate class and show user prompt
        })
    }
    
    func getInitialObjects<T : Codable>(noOfobjects : UInt, node : String, observerType : DataEventType, decodedData : @escaping (_  objects : [T]?) -> ()) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node)
            .queryOrdered(byChild: "key")
            .queryLimited(toFirst: noOfobjects)
            .observe(observerType, with: { (dataSnapshot) in
                if dataSnapshot.value != nil {
                    for snap in dataSnapshot.children.allObjects {
                        let value = snap as! DataSnapshot
                        if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any){
                            print(jsonData)
                            do {
                                let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                                objects.append(object)
                            } catch {
                                print(error)
                            }
                        }
                    }
                    decodedData(objects)
                }
            }, withCancel: {Error in
                print (Error)
                // pass through to appropriate class and show user prompt
            })
    }

    func paginatedFirebaseObserver<T : Codable>(startValue : String, endValue : String, node : String, observerType : DataEventType, decodedData : @escaping (_  objects : [T]?) -> ()) {
        let ref : DatabaseReference = Database.database().reference()
        var objects : [T] = []
        ref.child(node)
        .queryOrdered(byChild: "key")
        .queryStarting(atValue: startValue)
        .queryEnding(atValue: endValue)
            .queryLimited(toFirst: 10)
            .observeSingleEvent(of: observerType, with: { (dataSnapshot) in
            if dataSnapshot.value != nil {
                for snap in dataSnapshot.children.allObjects {
                     let value = snap as! DataSnapshot
                    if let jsonData = try? JSONSerialization.data(withJSONObject: value.value as Any){
                        print(jsonData)
                        do {
                            let object : T = try JSONDecoder().decode(T.self, from: jsonData)
                            objects.append(object)
                        } catch {
                            print(error)
                        }
                    }
                }
                decodedData(objects)
            }
        }, withCancel: {Error in
            print (Error)
            // pass through to appropriate class and show user prompt
        })
    }
    
    // MARK: image downloading and caching functions
    func downloadImage(imageUrl : URL, image : @escaping (_ image : UIImage?)->()) {
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { (data, response, error ) in
            var downloadedImage : UIImage?
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            if let image = downloadedImage {
                FNCacheManager.shared.imageCache.setObject(image, forKey: imageUrl.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                image(downloadedImage ?? UIImage(named: "football")!)
            }
        }
        dataTask.resume()
    }
    
    func getImage(imageUrl : URL, image : @escaping (_ image : UIImage?)->()) {
        if let cachedImage = FNCacheManager.shared.imageCache.object(forKey: imageUrl.absoluteString as NSString) {
            image(cachedImage)
        }
        else {
            downloadImage(imageUrl: imageUrl, image: image)
        }
    }
    
    func getCities(url : URL, onSuccess : @escaping (_ cities : [CityObject]?)->()) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let fetchedObjects = try JSONDecoder().decode([CityObject].self, from: data)
                    onSuccess(fetchedObjects)
                } catch {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}
