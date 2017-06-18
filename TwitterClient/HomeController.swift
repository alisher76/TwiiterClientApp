//
//  HomeController.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/18/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    // this gets called when cell is dequed
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    let wordLable: UILabel = {
        let label = UILabel()
        label.text = "test test test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func setUpViews() {
        backgroundColor = .yellow
        addSubview(wordLable)
        wordLable.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLable.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLable.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        wordLable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    let headerID = "headerID"
    let footerID = "footerID"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        //register cell id
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellID)
        //Register header
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        //registerFooter
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerID)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        //When cell is first registered its transparent
        
        return cell
    }
    
    //Confirm before implementing size for item, to protocol UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        header.backgroundColor = .blue
            return header
        }else{
            let footer  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            footer.backgroundColor = .green
            return footer
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}

