//
//  EventSercice.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
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
            guard let dimension = res.value as? [[String:Any]] else {return}
            let event = dimension.compactMap({ (elem) -> Event? in
                return Event(json: elem)
            })
            completion(event)
        }
    }
    
    public func createEvent(name: String,date: String,description: String,address: String,imageURL: String,completion: @escaping (Bool) -> Void) {
        
        let param = [
            "name": name,
            "date": date,
            "description": description,
            "adress": address,
            "image": imageURL
            ] as [String:Any]
        
        Alamofire.request("https://demo6576625.mockable.io/events", method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let x = response.value as? [String:Any] else {return}
            print(x)
        }
    }
}
