//
//  FNNewsfeedVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit
class FNNewsfeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var newsfeedVM : FNNewsfeedVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNibs()
        newsfeedVM = FNNewsfeedVM()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.reloadData()
        }
    }
    
    func registerProtocols () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerNibs() {
        let videoCellNib = UINib(nibName: FNConstants.VIDEO_NIB.rawValue , bundle: nil)
        tableView.register(videoCellNib, forCellReuseIdentifier: FNConstants.VIDEO_IDENTIFIER.rawValue)
    }
}

extension FNNewsfeedVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsfeedVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedObject = newsfeedVM?.itemAt(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.VIDEO_IDENTIFIER.rawValue) as! FNVideoCell
        if let urlString = feedObject?.url {
            let videoID = NewsFeedObject.getVideoID(url: urlString)
            cell.loadVideo(videoID: videoID)
        }
        return (cell)
    } 
}

