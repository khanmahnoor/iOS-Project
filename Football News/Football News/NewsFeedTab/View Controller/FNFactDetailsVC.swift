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
    @IBOutlet weak var factImage        :   UIImageView!
    @IBOutlet weak var factDescription  :   UILabel!
    var factDetailsVM                   :   FNFactDetailsVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFactDetails()
    }
}

extension FNFactDetailsVC {
    func initViewModel(feedObject : NewsFeedObject) {
        factDetailsVM = FNFactDetailsVM(feedObject : feedObject)
    }
    
    func setFactDetails() {
        factTitle.text          =   factDetailsVM?.getFactTitle()
        factDescription.text    =   factDetailsVM?.getFactDescription()
        factDetailsVM?.getFactImage(onSuccess: { (UIImage) in
            self.factImage.image = UIImage
        })
    }
}

