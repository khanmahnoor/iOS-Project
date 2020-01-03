//
//  FNNewsDetailsVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNNewsDetailsVM {
    // MARK: Properties
    var model   :   NewsFeedObject?
    
    // MARK: Initializer
    init(feedObject: NewsFeedObject) {
        model = feedObject
    }
}

extension FNNewsDetailsVM {
    /// Function to get news title
    ///
    /// - Returns: news title
    func getNewsTitle() -> String {
        return model?.title ?? ""
    }
    
    /// Function to get news Description
    ///
    /// - Returns: news description
    func getNewsDescription() -> String {
        return model?.description ?? ""
    }
}
