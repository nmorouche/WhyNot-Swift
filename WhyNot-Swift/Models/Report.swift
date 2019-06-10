//
//  Report.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 25/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public struct Report {
    
    var type: String
    var description:String
    
    
    init?(json: [String: Any]) {
        guard let type = json["type"] as? String,
              let description = json["description"] as? String else { return nil }
        self.type = type
        self.description = description
    }
    
    init(type: String, description: String) {
        self.type = type
        self.description = description
    }
    
    
}
