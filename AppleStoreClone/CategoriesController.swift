//
//  ViewController.swift
//  AppleStoreClone
//
//  Created by jhow on 17/03/2017.
//  Copyright © 2017 meowdev.tw. All rights reserved.
//

import UIKit

class CategoriesController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavController()
        collectionView?.backgroundColor = .white
        collectionView?.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Constant.CollectionViewHeaderIdentifier)
        collectionView?.register(CategoriesCell.self, forCellWithReuseIdentifier: Constant.CollectionViewCellIdentifier)
        collectionView?.register(LargeAppCell.self, forCellWithReuseIdentifier: Constant.LargeCellIdentifier)
        
    }
    
   
    private func setupNavController() {
        navigationItem.title = "Featured"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        var cell: UICollectionViewCell
     
        switch indexPath.item {
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.LargeCellIdentifier, for: indexPath) as! LargeAppCell
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.CollectionViewCellIdentifier, for: indexPath) as! CategoriesCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let frameSize: CGSize
        
        switch indexPath.item {
        case 2:
            frameSize = CGSize(width: view.bounds.width, height: 100)
        default:
            frameSize = CGSize(width: view.bounds.width, height: 210)
        }
        
        return frameSize
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: Constant.CollectionViewHeaderIdentifier, for: indexPath)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 150)
    }
        
    struct Constant {
        static let LargeCellIdentifier: String = "lgeCellId"
        static let CollectionViewCellIdentifier: String = "cellId"
        static let CollectionViewHeaderIdentifier: String = "headerId"
    }
    
}

