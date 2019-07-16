//
//  NewsFeedObject.swift
//  Football News
//
//  Created by Mahnoor Khan on 15/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

struct NewsFeedObject : Codable {
    var url : String
    var title : String
    var description : String
    var type : Int
}
