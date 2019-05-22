//
//  EventService.swift
//  WhyNot-Swift
//
//  Created by Nassim Morouche on 15/05/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation
import Alamofire

public class EventService {
    
    public static let `default` = EventService()
    private init(){
        
    }
    
    public func getEvents(completion: @escaping ([Event]) -> Void) {
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let event = res.value as? [[String:Any]] else {return}
            let events = event.compactMap({ (elem) -> Event? in
                return Event(json: elem)
            })
            completion(events)
        }
    }
    
    public func getEvent(completion: @escaping (Event) -> Void) {
        Alamofire.request("https://demo6576625.mockable.io/events").responseJSON { (res) in
            guard let event = res.result.value as? [String:Any] else {return}
            let singleEvent = Event(name: event["name"] as! String, date: event["date"] as! String, description: event["desctiption"] as! String, address: event["adresse"] as! String, imageURL: event["image"] as! String)
            completion(singleEvent)
        }
    }
    
    public func insertEvent(title:String,date:String,adress:String,image:String,description:String,completion: @escaping (Any) -> Void) {
        let param = [
            "title":title,
            "description":description,
            "date":date,
            "adress":adress,
            "image":image
        ]
        Alamofire.request("https://demo6576625.mockable.io/events",method: .post,parameters: param,encoding: JSONEncoding.default).responseJSON { (res) in
            guard let code = res.result.value as? [String:Any] else {return}
            let result = code["status_code"]
            completion(res)
        }
    }
    
    public func editEvent(title:String,date:String,adress:String,image:String,description:String,completion: @escaping (Any) -> Void) {
        let param = [
            "title":title,
            "description":description,
            "date":date,
            "adress":adress,
            "image":image
        ]
        Alamofire.request("https://demo6576625.mockable.io/events",method: .post,parameters: param,encoding: JSONEncoding.default).responseJSON { (res) in
            guard let code = res.result.value as? [String:Any] else {return}
            let result = code["status_code"]
            completion(res)
        }
    }

}
