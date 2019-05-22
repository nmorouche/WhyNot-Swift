//
//  Event.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public struct Event {
    var name: String
    var date: String
    var description: String
    var address: String
    var imageURL: String
    
    init?(json: [String: Any]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let name = json["name"] as? String,
            let date = json["date"] as? String,
            let description = json["description"] as? String,
            let address = json["adress"] as? String,
            let imageURL = json["image"] as? String else { return nil }
        self.name = name
        self.date = date
        self.description = description
        self.address = address
        self.imageURL = imageURL
    }
    
    init(name: String, date: String, description: String, address: String, imageURL: String) {
        self.name = name
        self.date = date
        self.description = description
        self.address = address
        self.imageURL = imageURL
    }
}
