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
    let constants                       :   FNConstants     =   FNConstants()
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        registerProtocols()
        registerNib()
        initViewModel()
        setupCollectionViewItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let item = sender as? GalleryObject else { return }
        if segue.identifier == constants.GALLERY_SEGUE {
            let destination = segue.destination as? FNImageDetailsVC
            destination?.initViewModel(galleryItem: item)
        }
    }
}

extension FNGalleryVC {
    /// Function to initialize view model
    func initViewModel() {
        galleryVM = FNGalleryVM()
    }
    
    /// Function to register delegate and data source for collection view
    func registerProtocols() {
        collectionView.delegate     =   self
        collectionView.dataSource   =   self
    }
    
    /// Function to register nib for collection view
    func registerNib() {
        let nib = UINib(nibName: constants.GALLERY_NIB, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: constants.GALLERY_IDENTIFIER)
    }
    
    /// Function to set Collection view item
    func setupCollectionViewItem() {
        let lineSpacing         :   CGFloat     =   3
        let interItemSpacing    :   CGFloat     =   3
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

// MARK: Collection View Functions
extension FNGalleryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryVM?.itemCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let galleryItem = galleryVM?.itemAt(indexPath) else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: constants.GALLERY_IDENTIFIER, for: indexPath) as? FNGalleryCell else  { return UICollectionViewCell() }
        cell.setImage(galleryObject: galleryItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = galleryVM?.itemAt(indexPath)
        performSegue(withIdentifier: constants.GALLERY_SEGUE, sender: item)
    }
}
