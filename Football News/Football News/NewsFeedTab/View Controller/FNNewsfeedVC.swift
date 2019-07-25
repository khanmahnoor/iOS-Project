//
//  FNNewsfeedVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 16/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNNewsfeedVC: UIViewController {

    // MARK: Properties and Outlets
    @IBOutlet weak var tableView    :   UITableView!
    var newsfeedVM                  :   FNNewsfeedVM?
    let constants                   :   FNConstants     =   FNConstants()
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNibs()
        initViewModel()
    }
}

// MARK: Registration Functions Extension
extension FNNewsfeedVC {
    func registerProtocols () {
        tableView.delegate      =   self
        tableView.dataSource    =   self
    }
    
    func registerNibs() {
        let videoCellNib    =   UINib(nibName: constants.VIDEO_NIB, bundle: nil)
        let factCellNib     =   UINib(nibName: constants.FACT_NIB, bundle: nil)
        let newsCellNib     =   UINib(nibName: constants.NEWS_NIB, bundle: nil)
        
        tableView.register(videoCellNib, forCellReuseIdentifier: constants.VIDEO_IDENTIFIER)
        tableView.register(factCellNib, forCellReuseIdentifier: constants.FACT_IDENTIFIER)
        tableView.register(newsCellNib, forCellReuseIdentifier: constants.NEWS_IDENTIFIER)
    }
    
    func initViewModel() {
        newsfeedVM = FNNewsfeedVM()
    }
}

// MARK: Table View Functions Extension
extension FNNewsfeedVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsfeedVM?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedObject = newsfeedVM?.itemAt(indexPath)
        switch feedObject?.type {
        case 0:
            guard let cell  =   tableView.dequeueReusableCell(withIdentifier: constants.VIDEO_IDENTIFIER) as? FNVideoCell else { return UITableViewCell() }
            cell.delegate   =   self
            cell.setTag(buttonTag :  indexPath.row)
            if let vID = feedObject?.getVideoID() {
                cell.loadVideo(videoID: vID)
            }
            return cell
        case 1:
            guard let cell  =   tableView.dequeueReusableCell(withIdentifier: constants.FACT_IDENTIFIER) as? FNFactCell else { return UITableViewCell() }
            cell.delegate   =   self
            cell.setTag(buttonTag :  indexPath.row)
            if let feedObject = feedObject {
                cell.loadFact(fact: feedObject)
            }
            return cell
        case 2:
            guard let cell  =   tableView.dequeueReusableCell(withIdentifier: constants.NEWS_IDENTIFIER) as? FNNewsCell else { return UITableViewCell() }
            cell.delegate   =    self
            cell.setTag(buttonTag :  indexPath.row)
            if let feedObject = feedObject {
                cell.loadNews(news: feedObject)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: Share/Watch/Read button Function
extension FNNewsfeedVC : FNButtonAction {
    func onClickWatch(_ tag: Int) {
        guard let item = newsfeedVM?.itemThroughIndex(tag) else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch item.type {
        case 0:
            let vc = storyboard.instantiateViewController(withIdentifier: constants.VIDEO_DETAILS) as! FNVideoDetailsVC
            vc.initViewModel(feedObject: item)
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard.instantiateViewController(withIdentifier: constants.FACT_DETAILS) as! FNFactDetailsVC
            vc.initViewModel(feedObject: item)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard.instantiateViewController(withIdentifier: constants.NEWS_DETAILS) as! FNNewsDetailsVC
            vc.initViewModel(feedObject: item)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return
        }
    }
    
    func onClickShare(_ tag: Int) {
        let item        = newsfeedVM?.itemThroughIndex(tag)
        let itemToShare = [item?.url]
        let activityViewController = UIActivityViewController(activityItems: itemToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
