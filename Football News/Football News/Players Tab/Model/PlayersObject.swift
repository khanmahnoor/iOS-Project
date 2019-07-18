//
//  PlayersObject.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

struct PlayerObject : Codable {
    var url : String
    var title : String
    var description : String
    var type : Int
    
    static func getVideoID (url : String) -> String {
        if let index = url.lastIndex(of: "/") {
            let range = url.index(after: index)
            let ID = String(url[range...])
            return ID
        }
        return "rdjnkb4ONWk"
    }
}
