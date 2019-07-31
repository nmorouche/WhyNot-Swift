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
    private let baseurl: String
    private init(){
        self.baseurl = "https://whynot-api.herokuapp.com/events"
    }
    let headers: HTTPHeaders = [
        "x-access-token": Session.default.token,
        "Content-Type": "application/json"
    ]
    
    public func getBaseURL() -> String {
        return self.baseurl;
    }
    
    public func getEvents(completion: @escaping ([Event]) -> Void) {
        Alamofire.request(baseurl + "/", headers: headers).responseJSON { (res) in
            guard let result = res.value as? [String:Any],
                let events = result["events"] as? [[String:Any]] else { return }
            let eventsResult = events.compactMap({ (elem) -> Event? in
                return Event(json: elem)
            })
            completion(eventsResult)
        }
    }
    
//    public func insertEvent(params: [String:Any],completion: @escaping (Int) -> Void) {
//        Alamofire.request(baseurl + "/", method: .put, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (res) in
//            guard let code = res.result.value as? [String:Any],
//                let statusCode = res.response?.statusCode else { return }
//            if(statusCode == 200) {
//                completion(statusCode)
//            } else {
//                guard let error = code["error"] as? String else { return }
//                completion(statusCode)
//            }
//        }
//    }

    public func editEvent(params: [String:Any], completion: @escaping (Int) -> Void) {
        guard let _id = params["_id"] as? String else { return }
        Alamofire.request(baseurl + "/" + _id, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (res) in
            guard let code = res.result.value as? [String:Any],
                let statusCode = res.response?.statusCode else { return }
            if(statusCode == 200) {
                completion(statusCode)
            } else {
                guard let error = code["error"] as? String else { return }
                print(error)
                completion(statusCode)
            }
        }
    }
    
    public func insertEvent(params: [String:String], image: UIImage, completion: @escaping (SessionManager.MultipartFormDataEncodingResult) -> Void) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            if let imageData = image.jpegData(compressionQuality: 1) {
                guard var imageName = params["name"] else { return }
                imageName += ".png"
                multipartFormData.append(imageData, withName: "image", fileName: imageName, mimeType: "image/png")
            }
            
            for (key, value) in params {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }},
                         usingThreshold:UInt64.init(),
                         to: baseurl,
                         method: .put,
                         headers: headers,
                         encodingCompletion: { encodingResult in
                            completion(encodingResult)
        })
    }
}
