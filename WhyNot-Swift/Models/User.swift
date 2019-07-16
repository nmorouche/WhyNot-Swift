//
//  Event.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public struct User {
    var id :String
    var email: String
    var username:String
    var photo:String
    var birthdate:String
    var gender:Int
    var preference:Int
    var bio:String
    var isDeleted:Bool
    var updatedAt: String
    var banned: Bool
    var reported: Bool
    var viewers: [String]
    var createdAt: String

    init?(json: [String: Any]) {
        
        guard let email = json["email"] as? String,
            let birthdate = json["birthdate"] as? String,
            let username = json["username"] as? String,
            let isDeleted = json["isDeleted"] as? Bool,
            let banned = json["banned"] as? Bool,
            let reported = json["reported"] as? Bool,
            let viewers = json["viewers"] as? [String],
            let createdAt = json["createdAt"] as? String,
            let id = json["_id"] as? String,
            let photo = json["photo"] as? String,
            let gender = json["gender"] as? Int,
            let bio = json["bio"] as? String,
            let preference = json["preference"] as? Int else { return nil }
        
        if let updatedAt = json["updatedAt"] as? String {
            self.updatedAt = updatedAt
        } else {
            self.updatedAt = ""
        }

        
        self.email = email
        self.birthdate = birthdate
        self.username = username
        self.photo = photo
        self.gender = gender
        self.bio = bio
        self.preference = preference
        self.id = id
        self.isDeleted = isDeleted
        self.banned = banned
        self.reported = reported
        self.viewers = viewers
        self.createdAt = createdAt
    }
    
    init(email: String, username: String, birthdate: String, gender: Int, photo: String,preference: Int,bio: String,id:String, isDeleted: Bool, updatedAt: String, banned: Bool, reported: Bool, viewers: [String], createdAt: String) {
        self.email = email
        self.username = username
        self.birthdate = birthdate
        self.gender = gender
        self.photo = photo
        self.preference = preference
        self.bio = bio
        self.id = id
        self.isDeleted = isDeleted
        self.updatedAt = updatedAt
        self.banned = banned
        self.reported = reported
        self.viewers = viewers
        self.createdAt = createdAt
    }
}
