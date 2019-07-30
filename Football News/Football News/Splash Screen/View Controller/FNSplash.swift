//
//  ViewController.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit


class  FNSplash: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startIndicator()
        fetchData()
    }
}

extension FNSplash {
    /// Function to start indicator
    func startIndicator() {
        indicator.startAnimating()
    }
    
    /// Function to stop indicator and proceed to homescreen
    func fetchData() {
        _ = FNDataManager.shared
        FNDataManager.shared.feedDataFetched = { [weak self] in
            self?.indicator?.stopAnimating()
            self?.proceedToHomeScreen()
        }
    }
    
    /// Function to change root view controller to Main after data is fetched
    func proceedToHomeScreen() {
        let targetStoryboard        =   UIStoryboard(name: "Main", bundle: nil)
        guard let targetViewController =   targetStoryboard.instantiateInitialViewController() else { return }
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = targetViewController
    }
}
