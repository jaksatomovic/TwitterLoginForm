//
//  User.swift
//  RChat
//
//  Created by Max Alexander on 2/1/17.
//  Copyright © 2017 Max Alexander. All rights reserved.
//

import Foundation
import RealmSwift

class User : Object {
    dynamic var userID: String = ""
    dynamic var username: String = ""
    dynamic var fullName : String = ""
    //dynamic var profileImage: NSData? = nil // optionals supported

    var defaultingName: String {
        if !fullName.isEmpty {
            return fullName
        }
        return "@\(username)"
    }

    override static func primaryKey() -> String? {
        return "userID"
    }
    override static func ignoredProperties() -> [String] {
        return ["defaultingName"]
    }
}

extension User {

    static func getMe() -> User! {
        let realm = TwitterConstants.Realms.global
        return realm.object(ofType: User.self, forPrimaryKey: TwitterConstants.myUserId)
    }

    static func searchForUsers(searchTerm: String) -> Results<User> {
        let realm = TwitterConstants.Realms.global
        let predicate = NSPredicate(format: "(username contains[c] %@ OR displayName contains[c] %@) AND (userId != %@)", searchTerm, searchTerm, TwitterConstants.myUserId)
        return realm.objects(User.self).filter(predicate)
    }

}
