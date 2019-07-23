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
    var buttonTag               : Int?
    var delegate                : FNButtonAction?
    @IBOutlet weak var sButton  : UIButton!
    @IBOutlet weak var urlView  : URLEmbeddedView!
   
    // MARK: Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        registerTag()
    }
}

// MARK: Registration Functions
extension FNNewsCell {
    func setTag(buttonTag : Int) {
        self.buttonTag = buttonTag
    }
    
    func registerTag() {
        sButton.tag = buttonTag ?? 0
    }
}

// MARK: Load News
extension FNNewsCell {
    func loadNews (news : NewsFeedObject) {
        urlView.load(withURLString: news.url)
    }
}

// MARK: Share Button Function
extension FNNewsCell {
    @IBAction func shareButton(_ sender : UIButton) {
        delegate?.onClick(sender.tag)
    }
}
