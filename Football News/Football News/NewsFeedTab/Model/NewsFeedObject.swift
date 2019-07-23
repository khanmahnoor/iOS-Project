//
//  NewsFeedObject.swift
//  Football News
//
//  Created by Mahnoor Khan on 15/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

struct NewsFeedObject : Codable {
    // MARK: Properties
    var type        : Int
    var url         : String
    var title       : String
    var description : String
}

// MARK: Functions
extension NewsFeedObject {
    func getVideoID () -> String {
        if let index    =   url.lastIndex(of: "/") {
            let range   =   url.index(after: index)
            let ID      =   String(url[range...])
            return ID
        }
        return "rdjnkb4ONWk"
    }
}
