//
//  FNNewsfeedVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNNewsfeedVM {
    var model : [NewsFeedObject]?
    var itemCount : Int {
        get {
            return model?.count ?? 0
        }
    }
    
    init() {
        fetchFeed()
    }
}

extension FNNewsfeedVM {
    func itemAt(_ indexpath: IndexPath) -> NewsFeedObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexpath.row]
    }
}

extension FNNewsfeedVM : NewsfeedService {
    func fetchFeed() {
        fetchNewsfeed { (objects) in
            if let fetchedObjects : [NewsFeedObject] = objects {
                self.model = fetchedObjects
            }
        }
    }
}
