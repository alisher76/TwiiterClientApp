//
//  HomeDataSource.swift
//  TwitterClient
//
//  Created by Alisher Abdukarimov on 6/18/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let alisher = User(name: "Alisher", userName: "@mralisher.a", bioText: "Whats up people how is it going today?", profileImage: #imageLiteral(resourceName: "Alisher Abdukarimov"))
        let dada = User(name: "Yorqin P", userName: "@mrDada", bioText: "I will make this better world when i will be rich as fuck or wont who cares? ", profileImage: #imageLiteral(resourceName: "Dadajonim1"))
        return [alisher, dada]
    }()
    
    let tweets: [Tweet] = {
        let alisher = User(name: "Alisher", userName: "@mralisher.a", bioText: "Whats up people how is it going today?", profileImage: #imageLiteral(resourceName: "Alisher Abdukarimov"))
        let tweet = Tweet(user: alisher, message: "Hello world today its fun cuz everyday is fun its a chance to improve your skilss. dont waste time plating fifa all the time bro!")
        let tweet2 = Tweet(user: alisher, message: "This is the second example text message and bla bla bla!")
        return [tweet, tweet2]
    }()
    //let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    override func numberOfSections() -> Int {
        return 2 
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}

