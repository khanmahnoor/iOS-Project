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
        initViewModel()
    }
}

extension FNNewsfeedVC {
    func registerProtocols () {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerNibs() {
        let videoCellNib    =   UINib(nibName: FNConstants.VIDEO_NIB.rawValue , bundle: nil)
        let factCellNib     =   UINib(nibName: FNConstants.FACT_NIB.rawValue, bundle: nil)
        let newsCellNib     =   UINib(nibName: FNConstants.NEWS_NIB.rawValue, bundle: nil)
        
        tableView.register(videoCellNib, forCellReuseIdentifier: FNConstants.VIDEO_IDENTIFIER.rawValue)
        tableView.register(factCellNib, forCellReuseIdentifier: FNConstants.FACT_IDENTIFIER.rawValue)
        tableView.register(newsCellNib, forCellReuseIdentifier: FNConstants.NEWS_IDENTIFIER.rawValue)
    }
    
    func initViewModel() {
        newsfeedVM = FNNewsfeedVM()
    }
}

extension FNNewsfeedVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsfeedVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedObject = newsfeedVM?.itemAt(indexPath)
        switch feedObject?.type {
        case 0:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.VIDEO_IDENTIFIER.rawValue) as? FNVideoCell else { return UITableViewCell() }
            let videoID = feedObject?.getVideoID()
            if let vID = videoID {
                cell.loadVideo(videoID: vID)
            }
            return (cell)
            
        case 1:
            
            //return fact cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.FACT_IDENTIFIER.rawValue) as? FNFactCell else { return UITableViewCell() }
            return cell
            
        case 2:
            
            //return news cell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FNConstants.NEWS_IDENTIFIER.rawValue) as? FNNewsCell else { return UITableViewCell() }
            if let feedObject = feedObject {
                cell.loadNews(news: feedObject)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

