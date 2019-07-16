//
//  FNVideoCell.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class FNVideoCell: UITableViewCell {

    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func lala (_ u : String) {
        videoPlayer.delegate = self
        videoPlayer.load(withVideoId: u)
//        videoPlayer.loadVideo(byURL: u, startSeconds: 0.0, suggestedQuality: .auto)
    }

}

extension FNVideoCell : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
//        videoPlayer.playVideo()

    }
    
}
