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
    @IBOutlet weak var video    :   YTPlayerView!

    // MARK: Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        registerTag()
        registerProtocol()
    }
}

// MARK: Registration Functions Extension
extension FNVideoCell {
    func setTag(buttonTag : Int) {
        self.buttonTag = buttonTag
    }
    
    func registerTag() {
        sButton.tag = buttonTag ?? 0
    }
    
    func registerProtocol() {
        video.delegate = self
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

// MARK: Player View Delegate
extension FNVideoCell : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        video.playVideo()
    }
}

// MARK: Share Button Function
extension FNVideoCell {
    @IBAction func shareButton(_ sender: UIButton) {
        delegate?.onClick(sender.tag)
    }
}
