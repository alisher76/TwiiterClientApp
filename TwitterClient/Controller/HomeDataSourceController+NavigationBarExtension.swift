//
//  HomeDataSourceController+NavigationBarExtension.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/19/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    
    func setUpNavigationBarItems() {
        //Adding navigation bar item
        setupLeftBarButtonItem()
        setupRightButtonItems()
        setupRemainingBarItems()
    }
    
    
    private func setupLeftBarButtonItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        followButton.imageView?.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let navigationBarSeperator = UIView()
        navigationBarSeperator.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navigationBarSeperator)
        // Set custom seperator for the navigation bar 
        navigationBarSeperator.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
    }
    private func setupRightButtonItems() {
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "icons8-Search Filled-50.png").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        searchButton.imageView?.contentMode = .scaleAspectFit
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "Icon-Compose.png").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.imageView?.contentMode = .scaleAspectFit
        composeButton.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    private func setupRemainingBarItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "Icon-Twitter"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
}
