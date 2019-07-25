//
//  FNVideoDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNVideoDetailsVM {
    // MARK: Properties
    var model   :   NewsFeedObject?
    
    init(feedObject : NewsFeedObject) {
        model = feedObject
    }
}

// MARK: Functions
extension FNVideoDetailsVM {
    func getVideoTitle() -> String {
        return model?.title ?? ""
    }
    
    func getVideoDescription() -> String {
        return model?.description ?? ""
    }
    
    func getVideoId() -> String {
        return model?.getVideoID() ?? ""
    }
}
