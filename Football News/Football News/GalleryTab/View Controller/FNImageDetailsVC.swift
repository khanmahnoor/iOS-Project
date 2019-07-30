//
//  FNImageDetailsVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 23/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNImageDetailsVC: UIViewController {
    // MARK: Properties and Outlets
    var galleryDetailsVM            :   FNImageDetailsVM?
    @IBOutlet weak var galleryImage :   UIImageView!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }
}

extension FNImageDetailsVC {
    /// Function to initialize view Model
    ///
    /// - Parameter galleryItem: gallery object to initialize view model
    func initViewModel(galleryItem: GalleryObject) {
        self.galleryDetailsVM = FNImageDetailsVM(galleryImage: galleryItem)
    }
    
    /// Function to set Image in the image view
    func setImage() {
        galleryDetailsVM?.getPlayerImage(onSuccess: { image in
            self.galleryImage.image = image
        }, onFailure: { message in
            print(message)
        })
    }
}

extension FNImageDetailsVC {
    /// Function to implement share button functionality on gallery details view controller
    ///
    /// - Parameter sender: share button
    @IBAction func shareButton(_ sender: Any) {
        let image = galleryImage.image
        let imageToShare            =   [image]
        let activityViewController  =   UIActivityViewController(activityItems: imageToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
