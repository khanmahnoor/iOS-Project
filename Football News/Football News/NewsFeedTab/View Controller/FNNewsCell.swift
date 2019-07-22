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
    @IBOutlet weak var urlView: URLEmbeddedView!
}

extension FNNewsCell {
    func loadNews (news : NewsFeedObject) {
        urlView.load(withURLString: news.url)
    }
}
