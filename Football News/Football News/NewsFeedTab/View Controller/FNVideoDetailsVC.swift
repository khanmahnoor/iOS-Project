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

// MARK: Set Video Details Functions
extension FNVideoDetailsVC {
    func registerProtocol() {
         playerView.delegate =   self
    }
    
    func initViewModel(feedObject : NewsFeedObject) {
        videoDetailsVM      =   FNVideoDetailsVM(feedObject : feedObject)
    }
    
    func setVideoDetails() {
        videoTitle.text = videoDetailsVM?.getVideoTitle()
        videoDescription.text = videoDetailsVM?.getVideoDescription()
        if let videoID = videoDetailsVM?.getVideoId() {
            playerView.load(withVideoId: videoID, playerVars: ["playsinline" : 1,
                                                          "showinfo" : 0,
                                                          "rel" : 0,
                                                          "modestbranding" : 1,
                                                          "controls" : 1,
                                                          "origin" : "https://www.example.com"])
        }
    }
}

extension FNVideoDetailsVC : YTPlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
