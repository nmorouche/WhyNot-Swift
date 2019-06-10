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
    var sexe:String
    var preference:String
    var bio:String
    
    init?(json: [String: Any]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let email = json["email"] as? String,
            let birthdate = json["birthdate"] as? String,
            let username = json["username"] as? String,
            let id = json["_id"] as? String,
            let photo = json["photo"] as? String,
            let sexe = json["sexe"] as? String,
        let bio = json["bio"] as? String,
        let preference = json["preference"] as? String else { return nil }
        self.email = email
        self.birthdate = birthdate
        self.username = username
        self.photo = photo
        self.sexe = sexe
        self.bio = bio
        self.preference = preference
        self.id = id
    }
    
    init(email: String, username: String, birthdate: String, sexe: String, photo: String,preference: String,bio: String,id:String) {
        self.email = email
        self.username = username
        self.birthdate = birthdate
        self.sexe = sexe
        self.photo = photo
        self.preference = preference
        self.bio = bio
        self.id = id
    }
}
