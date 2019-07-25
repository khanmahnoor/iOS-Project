//
//  FNNewsDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNNewsDetailsVC: UIViewController {
    // MARK: Properties and Outlets
    @IBOutlet weak var newsTitle            :   UILabel!
    @IBOutlet weak var newsDescrpition      :   UILabel!
    var newsDetailsVM                       :   FNNewsDetailsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewsDetails()
    }
}

// MARK: Set News Details Functions
extension FNNewsDetailsVC {
    func initViewModel(feedObject : NewsFeedObject) {
        newsDetailsVM = FNNewsDetailsVM(feedObject : feedObject)
    }
    
    func setNewsDetails() {
        newsTitle.text          =   newsDetailsVM?.getNewsTitle()
        newsDescrpition.text    =   newsDetailsVM?.getNewsDescription()
    }
}
