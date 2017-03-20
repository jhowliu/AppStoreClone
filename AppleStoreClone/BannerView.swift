//
//  BannerView.swift
//  AppleStoreClone
//
//  Created by jhow on 20/03/2017.
//  Copyright © 2017 meowdev.tw. All rights reserved.
//

import UIKit

class Header: CategoriesCell {
   
    let tmp: [String] = ["banner_4", "banner_1", "banner_2", "banner_3", "banner_4", "banner_1"]
    
    let head: IndexPath
    let tail: IndexPath
    
    override init(frame: CGRect) {
        head = IndexPath(item: 1, section: 0)
        tail = IndexPath(item: tmp.count-2, section: 0)
        super.init(frame: frame)
       
        backgroundColor = .blue
        
        setupViews()
    }
    
    override func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
      
        appCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        appCollectionView.register(bannerView.self, forCellWithReuseIdentifier: Constant.BannerViewIdentifier)
        appCollectionView.isPagingEnabled = true
        
        appCollectionView.showsHorizontalScrollIndicator = false
        
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
        // ADD THIS LINE AFTER WE SET THE DELEGATE / DATASOURCE
        appCollectionView.scrollToItem(at: head, at: .centeredHorizontally, animated: false)
        
        addSubview(appCollectionView)
    }
   
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tmp.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.BannerViewIdentifier, for: indexPath) as! bannerView
        
        cell.thumbNail.image = UIImage(named: tmp[indexPath.item])
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetWhenScrollToRight = Int(scrollView.frame.width) * (tmp.count-1)
        let offsetWhenScrollToLeft = 0
        let currentOffset = Int(scrollView.contentOffset.x)
       
        if currentOffset == offsetWhenScrollToRight {
            self.appCollectionView.scrollToItem(at: self.head, at: .centeredHorizontally, animated: false)
        }
        

        if currentOffset == offsetWhenScrollToLeft {
            self.appCollectionView.scrollToItem(at: self.tail, at: .centeredHorizontally, animated: false)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
   
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private class bannerView: AppCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
        
            setupViews()
        }
        
        override func setupViews() {
            thumbNail.layer.cornerRadius = 0
            thumbNail.frame = CGRect(x: 0, y: 0, width: frame.width + 2, height: frame.height)
            
            addSubview(thumbNail)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}
