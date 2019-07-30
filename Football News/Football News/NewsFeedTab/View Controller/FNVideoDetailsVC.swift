//
//  FNVideoDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class FNVideoDetailsVC: UIViewController {
    // MARK: Properties and Outlets
    var videoDetailsVM                  :   FNVideoDetailsVM?
    @IBOutlet weak var videoTitle       :   UILabel!
    @IBOutlet weak var playerView       :   YTPlayerView!
    @IBOutlet weak var videoDescription :   UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVideoDetails()
        registerProtocol()
    }
}

extension FNVideoDetailsVC {
    /// Function to set player view delegate
    func registerProtocol() {
         playerView.delegate =   self
    }
    
    /// Function to initialize View model
    ///
    /// - Parameter feedObject: newsfeed object for viewModel's initialization
    func initViewModel(feedObject: NewsFeedObject) {
        videoDetailsVM      =   FNVideoDetailsVM(feedObject : feedObject)
    }
    
    /// Function to set video details
    func setVideoDetails() {
        videoTitle.text = videoDetailsVM?.getVideoTitle()
        videoDescription.text = videoDetailsVM?.getVideoDescription()
        if let videoID = videoDetailsVM?.getVideoId() {
            playerView.load(withVideoId: videoID, playerVars: ["playsinline": 1])
        }
    }
}

extension FNVideoDetailsVC: YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
