//
//  FNGalleryVC.swift
//  Football News
//
//  Created by Mahnoor Khan on 18/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

class FNGalleryVC: UIViewController {
    // MARK: Properties and Outlets
    var galleryVM                       :   FNGalleryVM?
    @IBOutlet weak var collectionView   :   UICollectionView!
    var collectionViewFlowLayout        :   UICollectionViewFlowLayout!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNib()
        initViewModel()
        setupCollectionViewItemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? GalleryObject else { return }
        if segue.identifier == FNConstants.GALLERY_SEGUE.rawValue {
            let destination = segue.destination as? FNImageDetailsVC
            destination?.initViewModel(galleryItem: item)
        }
    }
}

// MARK: Registration Functions
extension FNGalleryVC {
    func initViewModel() {
        galleryVM = FNGalleryVM()
    }
    
    func registerProtocols() {
        collectionView.delegate     =   self
        collectionView.dataSource   =   self
    }
    
    func registerNib() {
        let nib = UINib(nibName: FNConstants.GALLERY_NIB.rawValue, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: FNConstants.GALLERY_IDENTIFIER.rawValue)
    }
    
    func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let lineSpacing         :   CGFloat     =   5
            let interItemSpacing    :   CGFloat     =   5
            let numberOfItemForRow  :   CGFloat     =   2
            
            let width   =   (collectionView.frame.width  - (numberOfItemForRow - 1) * interItemSpacing) / numberOfItemForRow
            let height  =   width
            
            collectionViewFlowLayout                            =   UICollectionViewFlowLayout()
            collectionViewFlowLayout.scrollDirection            =   .vertical
            collectionViewFlowLayout.minimumLineSpacing         =   lineSpacing
            collectionViewFlowLayout.sectionInset               =   UIEdgeInsets.zero
            collectionViewFlowLayout.minimumInteritemSpacing    =   interItemSpacing
            collectionViewFlowLayout.itemSize                   =   CGSize(width: width, height: height)
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true )
        }
    }
}

// MARK: Collection View Functions
extension FNGalleryVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryVM?.itemCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let galleryItem = galleryVM?.itemAt(indexPath) else {
            return UICollectionViewCell()
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FNConstants.GALLERY_IDENTIFIER.rawValue, for: indexPath) as? FNGalleryCell else  {
            print("here")
            return UICollectionViewCell()
        }
        
        cell.setImage(galleryObject: galleryItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = galleryVM?.itemAt(indexPath)
        performSegue(withIdentifier: FNConstants.GALLERY_SEGUE.rawValue, sender: item)
    }
}
