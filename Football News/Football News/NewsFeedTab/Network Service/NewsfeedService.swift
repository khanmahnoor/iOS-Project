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
    
    func fetchInitialFeed(noOfObjects : UInt, onSuccess : @escaping (fetchedData)) {
        let node = "Newsfeed"
        let observerType = DataEventType.value
        getInitialObjects(noOfobjects: noOfObjects, node: node, observerType: observerType, decodedData: onSuccess)
    }
    
    func fetchFeedForPagination(start : String, end : String, onSuccess : @escaping (fetchedData)) {
        let node = "Newsfeed"
        let observerType = DataEventType.value
        paginatedFirebaseObserver(startValue: start, endValue: end, node: node, observerType: observerType, decodedData: onSuccess)
    }
}
