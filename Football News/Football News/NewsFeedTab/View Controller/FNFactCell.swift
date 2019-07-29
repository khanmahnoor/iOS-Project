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
    var delegate                    :   FNButtonAction?
    @IBOutlet weak var title        :   UILabel!
    @IBOutlet weak var sButton      :   UIButton!
    @IBOutlet weak var rButton      :   UIButton!
    @IBOutlet weak var factImage    :   UIImageView!
   
    // MARK: Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Regustration Functions
extension FNFactCell {
    func setTag(buttonTag : Int) {
        self.buttonTag = buttonTag
    }
}

// MARK: Load Fact
extension FNFactCell : NetworkEngine {
    func loadFact(fact : NewsFeedObject) {
        title.text = fact.title
        if let url : URL = URL(string: fact.url) {
            factImage.layer.cornerRadius = 10
            getImage(imageUrl: url) { (UIImage) in
                self.factImage.contentMode = .scaleAspectFill
                self.factImage.image = UIImage
            }
        }
        else {
            factImage.contentMode = .scaleAspectFit
            factImage.image = UIImage(named: "football")
        }
    }
}

// MARK: Share Button Function
extension FNFactCell {
    @IBAction func shareButton(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            delegate?.onClickShare(buttonTag)
        }
    }
    
    @IBAction func readButton(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            delegate?.onClickWatch(buttonTag)
        }
    }
}
