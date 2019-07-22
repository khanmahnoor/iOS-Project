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

    @IBOutlet weak var video: YTPlayerView!

    override func awakeFromNib() {
        super.awakeFromNib()
        registerProtocol()
    }
}

extension FNVideoCell {
    
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

extension FNVideoCell : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        video.playVideo()
    }
}
