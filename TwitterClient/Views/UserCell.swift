//
//  UserCell.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/18/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else {return}
            userName.text = user.userName
            nameLabel.text = user.name
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
            // Change the color so it would be different than collection view background color!
            backgroundColor = .white
        }
    }
    
    let followButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("+ Follow", for: .normal)
        button.setTitleColor(twitterBlue , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return button
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.text = "iphone ipad whats up how is it going whats up its swift and its awesome guys!"
        textView.font = UIFont.systemFont(ofSize: 15)
        //TextView comes with default white background color so put it on clear so it does not cut off other elements!
        textView.backgroundColor = .clear
        return textView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Alisher Abdukarimov")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alisher A"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.backgroundColor = .white
        return label
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "@mralisher.a"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        //When elements added to hirarchy it matters how they show up
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userName)
        addSubview(bioTextView)
        addSubview(followButton)
        
        
        bioTextView.anchor(userName.bottomAnchor, left: userName.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        userName.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.leftAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 60, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
