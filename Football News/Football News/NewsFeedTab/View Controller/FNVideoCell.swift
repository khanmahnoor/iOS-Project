//
//  VideoCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 17/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class FNVideoCell: UITableViewCell {
    // MARK: Properties and Outlets
    var buttonTag               :   Int?
    var delegate                :   FNButtonAction?
    @IBOutlet weak var sButton  :   UIButton!
    @IBOutlet weak var wButton  :   UIButton!
    @IBOutlet weak var video    :   YTPlayerView!

    // MARK: Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Registration Functions Extension
extension FNVideoCell {
    func setTag(buttonTag : Int) {
        self.buttonTag = buttonTag
    }
    
    func loadVideo(videoID : String) {
        video.load(withVideoId: videoID, playerVars: ["playsinline" : 1,
                                                      "showinfo" : 0,
                                                      "rel" : 0,
                                                      "modestbranding" : 1,
                                                      "controls" : 1,
                                                      "origin" : "https://www.example.com"])
    }
}

// MARK: Share Button Function
extension FNVideoCell {
    @IBAction func shareButton(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            delegate?.onClickShare(buttonTag)
        }
    }
    @IBAction func watchButton(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            delegate?.onClickWatch(buttonTag)
        }
    }
}
