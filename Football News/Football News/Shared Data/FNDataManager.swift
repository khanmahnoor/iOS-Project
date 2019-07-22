//
//  DataManager.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNDataManager {
    static let shared = FNDataManager()
    var feedDataFetched : (()->())?
    var model : [NewsFeedObject]?
    private init() {
        fetchFeed()
    }
    
    func returnModel()  -> [NewsFeedObject]{
        return model ?? []
    }
}

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
