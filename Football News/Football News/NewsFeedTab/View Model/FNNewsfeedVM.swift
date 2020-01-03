//
//  FNNewsfeedVM.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

class FNNewsfeedVM {
    // MARK: Properties
    var model       :   [NewsFeedObject]?
    var itemCount   :   Int {
        get {
            return model?.count ?? 0
        }
    }
    
    // MARK: Initializers
    init() {
        self.model = FNDataManager.shared.feedModel
    }
}

// MARK: Functions
extension FNNewsfeedVM {
    /// Function to return an item at a specific indexPath
    ///
    /// - Parameter indexpath: indexPath
    /// - Returns: Newsfeed object
    func itemAt(_ indexpath: IndexPath) -> NewsFeedObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[indexpath.row]
    }
    
    /// Function to return an item at a specific index
    ///
    /// - Parameter index: indexPath
    /// - Returns: Newsfeed object
    func itemThroughIndex(_ index: Int) -> NewsFeedObject? {
        guard let _model = model, itemCount > 0 else { return nil }
        return _model[index]
    }
}

extension FNNewsfeedVM : NewsfeedService {
    typealias failure       = (_ message: String?) -> ()
    typealias fetchedData   = (_ newsfeedObjects: [NewsFeedObject]?) -> ()
    /// Function to fetch more newsfeed Objects
    ///
    /// - Parameter onSuccess: completion handler for fetched data
    func getMoreItems(onSuccess: @escaping (fetchedData), onFailure: @escaping failure) {
        let start = FNDataManager.initialObjs + 1
        FNDataManager.initialObjs = start + 2
        fetchFeedForPagination(start: FNDataManager.shared.convertToString(number: start), end: FNDataManager.shared.convertToString(number: start + 2), onSuccess: onSuccess, onFailure: onFailure)
    }
}
