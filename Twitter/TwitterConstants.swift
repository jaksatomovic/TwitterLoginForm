//
//  RChatConstants.swift
//  RChat
//
//  Created by Max Alexander on 1/10/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

struct TwitterConstants {

    static var myUserId : String! {
        get {
            return SyncUser.current?.identity
        }
    }

    static var isLoggedIn : Bool {
        return SyncUser.current != nil
        //return true
    }

    static var objectServerEndpoint : URL {
        return URL(string: "realm://127.0.0.1:9080" )!
    }


    static var authServerEndpoint : URL {
        return URL(string: "http://127.0.0.1:9080" )!
    }
    
    static var globalRealmURL : URL {
        return URL(string: "\(TwitterConstants.objectServerEndpoint.absoluteString)/global")!
    }
    
    static var myRealmURL : URL {
        return URL(string: "\(TwitterConstants.objectServerEndpoint.absoluteString)/~/userRealm")!
    }

    static var genericConversationId : String = "pub|generic"

    struct Colors {
        //APP
        static var twitterBlue = UIColor(red: 61/255 ,green: 167/255 ,blue: 244/255 ,alpha: 1.0)
    }

    struct Fonts {
        static var regularFont = UIFont.systemFont(ofSize: 16)
        static var boldFont = UIFont.boldSystemFont(ofSize: 16)
        static var dateFont = UIFont.systemFont(ofSize: 14)
    }

    struct Images {
        static var twitterLogo = UIImage(named: "twitter-logo")?.withRenderingMode(.alwaysOriginal)
        static var titleIcon = UIImage(named: "title_icon")?.withRenderingMode(.alwaysOriginal)
        static var sendMessageIcon = UIImage(named: "send_message")?.withRenderingMode(.alwaysOriginal)
        static var searchIcon = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        static var retweetIcon = UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal)
        static var replyIcon = UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal)
        static var blankProfileIcon = UIImage(named: "profile_image")?.withRenderingMode(.alwaysOriginal)
        static var followIcon = UIImage(named: "follow")?.withRenderingMode(.alwaysOriginal)
        static var composeIcon = UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal)
        static var likeIcon = UIImage(named: "like")?.withRenderingMode(.alwaysOriginal)
    }

    struct Numbers {
        static var horizontalSpacing : CGFloat = 16
        static var minorHorizontalSpacing : CGFloat = 8
        static var verticalSpacing : CGFloat = 8
        static var majorVerticalSpacing : CGFloat = 16
        static var cornerRadius : CGFloat = 5
    }

    struct Realms {
        static var global : Realm {
            let syncServerURL = TwitterConstants.globalRealmURL
            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: syncServerURL))
            return try! Realm(configuration: config)
        }
        static var myRealm : Realm {
            let syncServerURL = TwitterConstants.myRealmURL
            let config = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: syncServerURL))
            return try! Realm(configuration: config)
        }
    }

}
