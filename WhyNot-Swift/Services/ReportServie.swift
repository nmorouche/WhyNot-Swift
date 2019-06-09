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
    private init(){
        
}
    public func getUsers(completion: @escaping ([User]) -> Void) {
        Alamofire.request("http://localhost:3000/report/").responseJSON { (res) in
            guard let user = res.value as? [String:Any],
            let user2 = user["users"] as? [[String:Any]] else {return}
            
            let users = user2.compactMap({ (elem) -> User? in
                return User(json: elem)
                
            })
            
            completion(users)
        }
    }
    
    public func getReports(id:String,completion: @escaping ([Report]) -> Void) {
        Alamofire.request("http://localhost:3000/report/\(id)").responseJSON { (res) in
            
            
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
        Alamofire.request("http://localhost:3000/report/ban",method: .post,parameters: param,encoding: JSONEncoding.default).responseJSON { (res) in
            
           
            
            guard let report = res.value as? [String:Any],
                let result = report["status"] as? Int else {return}
            
            print(result)
            completion(result)
        }
    }
    
    
    
}
