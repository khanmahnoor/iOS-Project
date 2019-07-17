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
     func addFirebaseObserver<T : Codable>(node : String, observerType : DataEventType, decodedData : @escaping (_  objects : [T]?) -> ()) {
        let ref : DatabaseReference = Database.database().reference()
        ref.child(node).observe(observerType, with: { (dataSnapshot) in
            if dataSnapshot.value != nil {
                if let jsonData = try? JSONSerialization.data(withJSONObject: dataSnapshot.value as Any) {
                    do {
                        let objects : [T] = try JSONDecoder().decode([T].self, from: (jsonData))
                        decodedData(objects)
                    } catch {
                        print(error)
                    }
                }
            }
        }, withCancel: {Error in
            print (Error)
        })
    }
}
