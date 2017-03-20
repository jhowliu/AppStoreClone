//
//  CategoriesCell.swift
//  AppleStoreClone
//
//  Created by jhow on 19/03/2017.
//  Copyright © 2017 meowdev.tw. All rights reserved.
//

import UIKit

class CategoriesCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let featuredName: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .yellow
        label.text = "New games we love"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(AppCell.self, forCellWithReuseIdentifier: Constant.AppCollectionViewIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .blue
       
        return cv
    }()
    
    let separatorLine: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        return line
    }()
    
    func setupViews() {
        addSubview(separatorLine)
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        separatorLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        addSubview(featuredName)
        featuredName.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        featuredName.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        addSubview(appCollectionView)
        appCollectionView.delegate = self
        appCollectionView.dataSource = self
       
        appCollectionView.topAnchor.constraint(equalTo: featuredName.bottomAnchor, constant: 5).isActive = true
        appCollectionView.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -5).isActive = true
        appCollectionView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Press")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = appCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.AppCollectionViewIdentifier, for: indexPath) as! AppCell
        
        return cell
    }
    // it will break if we use the constraint for the AppCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: appCollectionView.bounds.height)
    }
    
    struct Constant {
        static let AppCollectionViewIdentifier = "appCellectionId"
        static let BannerViewIdentifier = "BannerId"
    }
}

class AppCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        setupViews()
    }
    
    let thumbNail: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "hero")
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 25
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Almost a Hero"
        label.font = .systemFont(ofSize: 14)
        label.backgroundColor = .orange
        
        return label
    }()
    
    let category: UILabel = {
        let label = UILabel()
        label.text = "Games"
        label.textColor = .gray
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.text = "NT$ 150"
        label.textColor = .gray
        label.backgroundColor = .cyan
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
   
    func setupViews() {
        addSubview(thumbNail)
        thumbNail.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
        
        addSubview(name)
        name.frame = CGRect(x: 0, y: frame.width + 5, width: frame.width, height: 15)
        
        addSubview(category)
        category.frame = CGRect(x: 0, y: frame.width + 25, width: frame.width, height: 10)
        
        addSubview(price)
        price.frame = CGRect(x: 0, y: frame.width + 40, width: frame.width, height: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
