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
    
    // MARK: Initializer
    init(feedObject: NewsFeedObject) {
        model = feedObject
    }
}

extension FNVideoDetailsVM {
    /// function to get Video Title
    ///
    /// - Returns: video title
    func getVideoTitle() -> String {
        return model?.title ?? ""
    }
    
    /// Function to get video description
    ///
    /// - Returns: video description
    func getVideoDescription() -> String {
        return model?.description ?? ""
    }
    
    /// Function to get videoID
    ///
    /// - Returns: videoID
    func getVideoId() -> String {
        return model?.getVideoID() ?? "rdjnkb4ONWk"
    }
}
