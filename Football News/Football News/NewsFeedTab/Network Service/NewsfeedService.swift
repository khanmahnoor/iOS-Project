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

protocol NewsfeedService: NetworkEngine {}

extension NewsfeedService {
    typealias failure         =   (_ message: String) -> ()
    typealias fetchedNewsfeed =   (_ newsfeedObjects: [NewsFeedObject]?) -> ()
    /// Function to fetch initial objects for newsfeed
    ///
    /// - Parameters:
    ///   - noOfObjects: number of objects to be fetched
    ///   - onSuccess: completion handler for fetched objects
    func fetchInitialFeed(noOfObjects: UInt, onSuccess: @escaping fetchedNewsfeed, onFailure: @escaping failure) {
        let node = "Newsfeed"
        let observerType = DataEventType.value
        getInitialObjects(noOfobjects: noOfObjects, node: node, observerType: observerType, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    /// Function to fetch feed objects in a specific range (pagination)
    ///
    /// - Parameters:
    ///   - start: range start
    ///   - end: range end
    ///   - onSuccess: completion handler for fetched objects
    func fetchFeedForPagination(start: String, end: String, onSuccess: @escaping fetchedNewsfeed, onFailure: @escaping failure) {
        let node = "Newsfeed"
        let observerType = DataEventType.value
        paginatedFirebaseObserver(startValue: start, endValue: end, node: node, observerType: observerType, decodedData: onSuccess, onFailure: onFailure)
    }
}
