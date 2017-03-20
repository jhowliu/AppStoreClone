//
//  LargeAppVIew.swift
//  AppleStoreClone
//
//  Created by jhow on 20/03/2017.
//  Copyright © 2017 meowdev.tw. All rights reserved.
//

import UIKit

class LargeAppCell: CategoriesCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        appCollectionView.register(LargeCell.self, forCellWithReuseIdentifier: "largeCellId")
    }
    
    override func setupViews() {
        addSubview(separatorLine)
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        addSubview(appCollectionView)
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
       
        appCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -5).isActive = true
        appCollectionView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "largeCellId", for: indexPath) as! LargeCell
        
        cell.thumbNail.image = #imageLiteral(resourceName: "banner_1")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: appCollectionView.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private class LargeCell: AppCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupViews()
        }
        
        override func setupViews() {
            addSubview(thumbNail)
            thumbNail.layer.cornerRadius = 15
            thumbNail.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}
