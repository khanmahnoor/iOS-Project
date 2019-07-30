//
//  FNFactCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNFactCell: UITableViewCell {
    // MARK: Properties and Outlets
    var buttonTag                   :   Int?
    @IBOutlet weak var title        :   UILabel!
    @IBOutlet weak var sButton      :   UIButton!
    @IBOutlet weak var rButton      :   UIButton!
    @IBOutlet weak var factImage    :   UIImageView!
    var delegate                    :   FNButtonAction?
}

extension FNFactCell {
    /// Function to set the clicked row number in the table view
    ///
    /// - Parameter buttonTag: row number clicked
    func setTag(buttonTag: Int) {
        self.buttonTag = buttonTag
    }
}

extension FNFactCell: NetworkEngine {
    /// Function to load the fact in the table view cell
    ///
    /// - Parameter fact: fact Object to load
    func loadFact(fact: NewsFeedObject) {
        title.text = fact.title
        if let url : URL = URL(string: fact.url) {
            factImage.layer.cornerRadius = 10
            getImage(imageUrl: url, onSuccess: { image in
                self.factImage.contentMode = .scaleAspectFill
                self.factImage.image = image
            }, onFailure: { message in
                print(message)
            })
        } else {
            factImage.contentMode   =   .scaleAspectFit
            factImage.image         =   UIImage(named: "football")
        }
    }
}

extension FNFactCell {
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
