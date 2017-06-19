//
//  HomeDataSourceController.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/18/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import LBTAComponents

class HomeDataSourceController: DatasourceController {
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        //Handles view rotation/size stretching!
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change background color of the collectionView
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setUpNavigationBarItems()
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
        
    }
    
    //gets rid of gap between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //this gives us a user object
        if let user = self.datasource?.item(indexPath) as? User {
            
            //lets get an estimation of the height of the cell based on the bio.text
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
            
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return.zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return.zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
