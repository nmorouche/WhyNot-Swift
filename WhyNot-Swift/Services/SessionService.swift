//
//  SessionService.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 10/06/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation
import Alamofire

public class SessionService {
    private let baseurl: String
    public static let `default` = SessionService()
    private init() {
        self.baseurl = "https://whynot-api.herokuapp.com/users/admin/"
    }
    
    public func signup(params: [String:Any],completion: @escaping (String, Int) -> Void) {
        Alamofire.request(baseurl + "signup", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (res) in
            guard let session = res.value as? [String:Any],
                let status = res.response?.statusCode else { return }
            if(status == 200) {
                guard let token = session["token"] as? String else { return }
                completion(token, status)
            } else {
                guard let error = session["error"] as? String else { return }
                completion(error, status)
            }
        }
    }
    
    public func login(params: [String:Any],completion: @escaping (String, Int) -> Void) {
        Alamofire.request(baseurl + "login", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { (res) in
            guard let session = res.value as? [String:Any],
                let status = res.response?.statusCode else { return }
            if(status == 200) {
                
                guard let token = session["token"] as? String else { return }
                completion(token, status)
            } else {
                guard let error = session["error"] as? String else { return }
                completion(error, status)
            }
        }
    }
}
