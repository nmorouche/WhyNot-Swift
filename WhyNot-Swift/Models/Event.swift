//
//  Event.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public struct Event {
    var name: String
    var date: Date
    var description: String
    var adress: String
    var image: String
    
    init?(json: [String: Any]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        guard let name = json["name"] as? String,
            let d = json["date"] as? String,
            let date = dateFormatter.date(from: d),
            let description = json["desc"] as? String,
            let adress = json["adress"] as? String,
            let image = json["image"] as? String else {
                return nil
        }
        self.name = name
        self.date = date
        self.description = description
        self.adress = adress
        self.image = image
        
    }
}
