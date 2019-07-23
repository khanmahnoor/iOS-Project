//
//  DataManager.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNDataManager {
    // MARK: Properties
    static let shared = FNDataManager()
    var model           : [NewsFeedObject]?
    var feedDataFetched : (()->())?
    
    // MARK: Initializer
    private init() {
        fetchFeed()
    }
}

// MARK: Fetch Feed
extension FNDataManager : NewsfeedService {
    func fetchFeed() {
        fetchNewsfeed { (objects) in
            if let fetchedObjects : [NewsFeedObject] = objects {
                self.model = fetchedObjects
                self.feedDataFetched?()
            } else {
                
            }
        }
    }
}
