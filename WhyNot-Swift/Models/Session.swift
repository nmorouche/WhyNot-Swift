//
//  Session.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 10/06/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation

public class Session {
    public static let `default` = Session()
    var token: String
    
    private init() {
        self.token = ""
    }
    
    public func setToken(token: String) {
        self.token = token
    }
}
