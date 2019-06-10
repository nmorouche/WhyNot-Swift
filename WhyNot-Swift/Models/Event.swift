//
//  Event.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public struct Event {
    var _id: String
    var name: String
    var description: String
    var address: String
    var date: String
    var imageURL: String
    var price: Int
    var sub_only: Bool
    
    init?(json: [String: Any]) {
        guard let _id = json["_id"] as? String,
            let name = json["name"] as? String,
            let description = json["description"] as? String,
            let address = json["address"] as? String,
            let date = json["date"] as? String,
            let imageURL = json["imageURL"] as? String,
            let price = json["price"] as? Int,
            let sub_only = json["sub_only"] as? Bool else { return nil }
        self._id = _id
        self.name = name
        self.description = description
        self.address = address
        self.date = date
        self.imageURL = imageURL
        self.price = price
        self.sub_only = sub_only
    }
    
    init(_id: String, name: String, description: String, address: String, date: String, imageURL: String, price: Int, sub_only: Bool) {
        self._id = _id
        self.name = name
        self.description = description
        self.address = address
        self.date = date
        self.imageURL = imageURL
        self.price = price
        self.sub_only = sub_only
    }
}
