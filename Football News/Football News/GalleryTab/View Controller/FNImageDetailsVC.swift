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

// MARK: Registration Functions
extension FNImageDetailsVC {
    func initViewModel(galleryItem  : GalleryObject) {
        self.galleryDetailsVM = FNImageDetailsVM(galleryImage: galleryItem)
    }
    
    func setImage() {
        galleryDetailsVM?.getPlayerImage(onSuccess: { (UIImage) in
            self.galleryImage.image = UIImage
        })
    }
}

// MARK: Share Button Function
extension FNImageDetailsVC {
    @IBAction func shareButton(_ sender: Any) {
        galleryDetailsVM?.getPlayerImage(onSuccess: { (image) in
            let imageToShare            =   [image]
            let activityViewController  =   UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        })
    }
}
