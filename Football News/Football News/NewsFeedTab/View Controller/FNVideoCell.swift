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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadVideo(videoID : String) {
        video.delegate = self
        video.load(withVideoId: videoID)
        //videoPlayer.loadVideo(byURL: u, startSeconds: 0.0, suggestedQuality: .auto)
    }
}

extension FNVideoCell : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        //videoPlayer.playVideo()
    }
}
