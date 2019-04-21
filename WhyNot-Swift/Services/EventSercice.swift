//
//  EventSercice.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import Foundation
//import Alamofire






public class EventService {
    
    public static let `default` = EventService()
    private init( ){
}

    public func getEvents(completion: @escaping ([Event]) -> Void) {
        Alamofire.request("lien de l'api").responseJSON{ (res) in
            guard let result = res.value as? [String:Any],
                let resultat2 = result["results"] as? [[String:Any]] else {
                    return
                    
            }
            
            
            let event = resultat2.compactMap({ (elem) -> Event? in
                return Event(json: elem)
            })
            completion(event)
        }
}
    
    public func createEvent(name: String,date: Date,description: String,adress: String,image: String,completion: @escaping (Bool) -> Void){
        
        
        
        let param = [
            
        "name": name,
        "date": date,
        "description": description,
        "adress": adress,
        "image": image
            ] as [String : Any]
        Alamofire.request("lien de l'api",method: .post, parameters: param, encoding: JSONEncoder.default).responseJSON{ (res) in
            let result = res.result.value as! [String: Any]
            let code = result["status_code"] as! Int
            completion(code == 1 )
        }
        
        
    }
    
    
}
