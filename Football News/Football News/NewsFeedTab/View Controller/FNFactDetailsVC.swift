//
//  FNFactDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 24/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNFactDetailsVC: UIViewController {
    // MARK: Properties and Outlets
    @IBOutlet weak var factTitle        :   UILabel!
    @IBOutlet weak var factDescription  :   UILabel!
    @IBOutlet weak var factImage        :   UIImageView!
    var factDetailsVM                   :   FNFactDetailsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFactDetails()
    }
}

extension FNFactDetailsVC {
    /// Function to initialize View model
    ///
    /// - Parameter feedObject: newsfeed object for viewModel's initialization
    func initViewModel(feedObject: NewsFeedObject) {
        factDetailsVM = FNFactDetailsVM(feedObject: feedObject)
    }
    
    /// Function to set fact details
    func setFactDetails() {
        factTitle.text          =   factDetailsVM?.getFactTitle()
        factDescription.text    =   factDetailsVM?.getFactDescription()
        factDetailsVM?.getFactImage(onSuccess: { image in
            self.factImage.image = image
        }, onFailure: { message in
            print(message)
        })
    }
}

