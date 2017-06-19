//
//  UserHeaderFooter.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/18/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserFooter: DatasourceCell {
    
    let textLabel: UILabel = {
        let textlabel = UILabel()
        textlabel.text = "Show Me More"
        textlabel.font = UIFont.systemFont(ofSize: 15)
        textlabel.textColor = twitterBlue
        return textlabel
    }()
    
    override func setupViews() {
        super.setupViews()
        // add white background view
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        // Change the color so it would be different than collection view background color!
        backgroundColor = UIColor(r: 232, g: 236, b: 241)
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        addSubview(whiteBackgroundView)
        addSubview(textLabel)
        
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        //change the bottom constant of the title
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
class UserHeader: DatasourceCell {
    
    let textLabel: UILabel = {
        let textlabel = UILabel()
        textlabel.text = "Who To Follow"
        textlabel.font = UIFont.systemFont(ofSize: 16)
        return textlabel
    }()
    
    override func setupViews() {
        super.setupViews()
        // Change the color so it would be different than collection view background color!
        backgroundColor = .white
        addSubview(textLabel)
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}



