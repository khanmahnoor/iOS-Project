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
    
    init(feedObject : NewsFeedObject) {
        model = feedObject
    }
}

// MARK: Functions
extension FNNewsDetailsVM {
    func getNewsTitle() -> String {
        return model?.title ?? ""
    }
    
    func getNewsDescription() -> String {
        return model?.description ?? ""
    }
}
