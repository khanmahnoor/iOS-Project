//
//  FNNewsCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import URLEmbeddedView

class FNNewsCell: UITableViewCell {
    // MARK: Properties and Outlets
    var buttonTag               :   Int?
    @IBOutlet weak var sButton  :   UIButton!
    @IBOutlet weak var rButton  :   UIButton!
    @IBOutlet weak var urlView  :   URLEmbeddedView!
    var delegate                :   FNButtonAction?
}

// MARK: Registration Functions
extension FNNewsCell {
    /// Function to set the clicked row number in the table view
    ///
    /// - Parameter buttonTag: row number clicked
    func setTag(buttonTag: Int) {
        self.buttonTag = buttonTag
    }
}

// MARK: Load News
extension FNNewsCell {
    /// Function to load news in the table view cell
    ///
    /// - Parameter news: url of the news to be loaded
    func loadNews(news: NewsFeedObject) {
        urlView.load(withURLString: news.url)
    }
}

extension FNNewsCell {
    /// Function for share button on newsfeed video cell
    ///
    /// - Parameter sender: row number clicked
    @IBAction func shareButton(_ sender: UIButton) {
        guard let buttonTag = buttonTag else { return }
        delegate?.onClickShare(buttonTag)
    }
    
    /// Function for read button on newsfeed video cell
    ///
    /// - Parameter sender: row number clicked
    @IBAction func readButton(_ sender: UIButton) {
        guard let buttonTag = buttonTag else { return }
        delegate?.onClickWatch(buttonTag)
    }
}
