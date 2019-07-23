//
//  ViewController.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit


class  FNSplash: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        _ = FNDataManager.shared
        FNDataManager.shared.feedDataFetched = { [weak self] in
            self?.indicator?.stopAnimating()
            self?.proceedToHomeScreen()
        }
    }
}

extension FNSplash {
    func proceedToHomeScreen() {        
        let targetStoryboard        =   UIStoryboard(name: "Main", bundle: nil)
        if let targetViewController =   targetStoryboard.instantiateInitialViewController() {
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = targetViewController
        }
    }
}
