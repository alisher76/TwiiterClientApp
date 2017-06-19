//
//  TweetCell.swift
//  
//
//  Created by Alisher Abdukarimov on 6/19/17.
//

import LBTAComponents



class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet{
            guard let tweet = datasourceItem as? Tweet else {return}
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)])
            
            let userNameString = (" \(tweet.user.userName) \n")
            
            attributedText.append(NSAttributedString(string: userNameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: range)
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)]))
            messageTextView.attributedText = attributedText
        }
    }
    
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME TEST TEST"
        tv.backgroundColor = .clear
        return tv
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Alisher Abdukarimov")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Icon-Reply.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Icon-Retweet.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Icon-Favorite.png"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "icons8-Paper Plane-50"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
        
        setUpBottomButtons()
        
    }
    
    private func setUpBottomButtons() {
        
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        
        let likeButtonContainerView = UIView()
        
        let directMessageContainerView = UIView()
        
        
        let buttonsStackedView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageContainerView])
        buttonsStackedView.axis = .horizontal
        buttonsStackedView.distribution = .fillEqually
        addSubview(buttonsStackedView)
        
        buttonsStackedView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: replyButtonContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: retweetButtonContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: likeButtonContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: directMessageContainerView.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
}
