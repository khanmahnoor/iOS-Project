//
//  FirebaseHelper.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct FirebaseHelper {
    
    private var ref : DatabaseReference?
    
    init () {
        if (self.ref == nil) {
            ref =  Database.database().reference()
        }
    }
    
    public func addNewsfeedObject(newsfeedObject : NewsFeedObject, id : String) {
        ref?.child("Newsfeed").child(id).setValue(["url" : newsfeedObject.url,
                                                   "title" : newsfeedObject.title ,
                                                   "description" : newsfeedObject.description ,
                                                   "type" : newsfeedObject.type])
    }
    
    public func getNewsfeedObjects(completion : @escaping (_  newsfeedObjects : [NewsFeedObject]?) -> ())  {
        ref?.child("Newsfeed").observe(.value, with: { (dataSnapshot) in
            if dataSnapshot.value != nil {
                if let json = try? JSONSerialization.data(withJSONObject: dataSnapshot.value as Any) {
                    do {
                        let newsfeedObject : [NewsFeedObject] = try JSONDecoder().decode([NewsFeedObject].self, from: (json))
                        completion(newsfeedObject)
                    } catch {
                        print (error)
                    }
                }
            }
        }, withCancel: {Error in
            print (Error)
        })
        
    }
}
