//
//  NewsfeedTabNetworkService.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol NewsfeedService : NetworkEngine {}

extension NewsfeedService {
    typealias fetchedData = (_  newsfeedObjects : [NewsFeedObject]?) -> ()
    
    func fetchNewsfeed(onSuccess : @escaping (fetchedData)) {
        let node = "Newsfeed"
        let observerType = DataEventType.childAdded
        addFirebaseObserver(node: node, observerType: observerType, decodedData: onSuccess)
    }
}
