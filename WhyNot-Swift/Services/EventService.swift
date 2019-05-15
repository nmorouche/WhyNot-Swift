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
}
