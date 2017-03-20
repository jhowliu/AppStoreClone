//
//  TabBarController.swift
//  AppleStoreClone
//
//  Created by jhow on 19/03/2017.
//  Copyright © 2017 meowdev.tw. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
    }
   
    private func setupViews() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        
        let featuredNavController = UINavigationController(rootViewController: CategoriesController(collectionViewLayout: layout))
        featuredNavController.title = "Featured"
        featuredNavController.tabBarItem.image = #imageLiteral(resourceName: "Featured")
        
        let categoriesNavController = UINavigationController(rootViewController: UICollectionViewController(collectionViewLayout: layout))
        categoriesNavController.title = "Categories"
        categoriesNavController.tabBarItem.image = #imageLiteral(resourceName: "Categories")
        
        let chartsNavController = UINavigationController(rootViewController: UICollectionViewController(collectionViewLayout: layout))
        chartsNavController.title = "Top Charts"
        chartsNavController.tabBarItem.image = #imageLiteral(resourceName: "Charts")
        
        let searchNavController = UINavigationController(rootViewController: UICollectionViewController(collectionViewLayout: layout))
        searchNavController.title = "Search"
        searchNavController.tabBarItem.image = #imageLiteral(resourceName: "Search")
        
        let updatesNavController = UINavigationController(rootViewController: UICollectionViewController(collectionViewLayout: layout))
        updatesNavController.title = "Categories"
        updatesNavController.tabBarItem.image = #imageLiteral(resourceName: "Updates")
        
        viewControllers = [featuredNavController, categoriesNavController,
                           chartsNavController, searchNavController, updatesNavController]
    }
}
