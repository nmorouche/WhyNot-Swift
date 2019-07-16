//
//  ReportServie.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 22/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation
import Alamofire

public class ReportService {
    
    public static let `default` = ReportService()
    private init(){}
    let headers: HTTPHeaders = [
        "x-access-token": Session.default.token,
        "Content-Type": "application/json"
    ]
    
    public func getUsers(completion: @escaping ([User]) -> Void) {
        Alamofire.request("https://whynot-api.herokuapp.com/report/", headers: headers).responseJSON { (res) in
            guard let user = res.value as? [String:Any],
            let user2 = user["users"] as? [[String:Any]] else {return}
            let users = user2.compactMap({ (elem) -> User? in
                let test = User(json: elem)
                return test
            })
            
            completion(users)
        }
    }
    
    public func getReports(id:String,completion: @escaping ([Report]) -> Void) {
        Alamofire.request("https://whynot-api.herokuapp.com/report/\(id)", headers: headers).responseJSON { (res) in
            
            
            guard let report = res.value as? [String:Any],
                let report2 = report["users"] as? [[String:Any]] else {return}
            let reports = report2.compactMap({ (elem) -> Report? in
                return Report(json: elem)
            })
            print(reports)
            completion(reports)
        }
    }
    
    public func banUser(id:String,completion: @escaping (Int) -> Void) {
        let param = [
            "idReported" : id
        ]
        
        Alamofire.request("https://whynot-api.herokuapp.com/report/ban",method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { (res) in
            
           
            
            guard let report = res.value as? [String:Any],
                let result = report["status"] as? Int else {return}
            
            print(result)
            completion(result)
        }
    }
    
    
    
}
