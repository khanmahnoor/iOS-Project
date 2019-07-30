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
    @IBOutlet weak var sButton  :   UIButton!
    @IBOutlet weak var wButton  :   UIButton!
    @IBOutlet weak var video    :   YTPlayerView!
    var delegate                :   FNButtonAction?
}

// MARK: Registration Functions Extension
extension FNVideoCell {
    /// Function to set the clicked row number in the table view
    ///
    /// - Parameter buttonTag: row number clicked
    func setTag(buttonTag: Int) {
        self.buttonTag = buttonTag
    }
    
    /// Function to load video in the table view cell (inline)
    ///
    /// - Parameter videoID: video ID to be loaded
    func loadVideo(videoID: String) {
        video.layer.cornerRadius = 10
        video.load(withVideoId: videoID, playerVars: ["playsinline": 1])
    }
}

extension FNVideoCell {
    /// Function for share button on newsfeed video cell
    ///
    /// - Parameter sender: row number clicked
    @IBAction func shareButton(_ sender: UIButton) {
        guard let buttonTag = buttonTag else { return }
        delegate?.onClickShare(buttonTag)
    }
    
    /// Function for watch button on newsfeed video cell
    ///
    /// - Parameter sender: row number clicked
    @IBAction func watchButton(_ sender: UIButton) {
        guard let buttonTag = buttonTag else { return }
        delegate?.onClickWatch(buttonTag)
    }
}
