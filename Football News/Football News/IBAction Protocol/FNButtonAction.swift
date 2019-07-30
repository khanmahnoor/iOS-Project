//
//  FNButtonAction.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import Foundation

protocol FNButtonAction {
    /// Function for share buttons in Newsfeed Tab
    ///
    /// - Parameter tag: Row number clicked in Table View
    func onClickShare(_ tag: Int)
    
    /// Function for Watch and ReadMore Button in Newsfeed Tab
    ///
    /// - Parameter tag: Row number clicked in Table View
    func onClickWatch(_ tag: Int)
}
