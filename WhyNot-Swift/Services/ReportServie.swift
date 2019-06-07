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
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let event = res.value as? [[String:Any]] else {return}
            let events = event.compactMap({ (elem) -> User? in
                return User(json: elem)
            })
            completion(events)
        }
    }
    
    public func getReports(completion: @escaping ([Report]) -> Void) {
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let report = res.value as? [[String:Any]] else {return}
            let reports = report.compactMap({ (elem) -> Report? in
                return Report(json: elem)
            })
            completion(reports)
        }
    }
    
    public func banUser(id:String,completion: @escaping (Any) -> Void) {
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let report = res.result.value as? [String:Any] else {return}
            let result = report["error"]
            completion(res)
        }
    }
    
    public func checkUser(id:String,completion: @escaping (Any) -> Void) {
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let report = res.result.value as? [String:Any] else {return}
            let result = report["error"]
            completion(res)
        }
    }
    
    
    
    
}
