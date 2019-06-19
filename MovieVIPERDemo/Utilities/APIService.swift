//
//  APIService.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    private var BASE_URL = "http://www.omdbapi.com/?apikey=fc89b5d1"
    static let shared = APIService()
    var headers = HTTPHeaders()
    let manager = Alamofire.SessionManager.default
    
    func request(api: String, type: HTTPMethod, parameters: [String:Any]?, decode: Bool = false, sessionTimeout: TimeInterval = 0.2, completion: @escaping(Any)->(), error: @escaping(Any)->()) {
        manager.session.configuration.timeoutIntervalForRequest = sessionTimeout
        manager.request(BASE_URL + api, method: type, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                switch response.result {
                    
                case .success(let JSON):
                    DLog(message: JSON)
                    if decode {
                        completion(JSON)
                    } else {
                        completion(response.data!)
                    }
                    
                case .failure(let err):
                    DLog(message: err)
                    error(err)
                }
            } else {
                DLog(message: response.error as Any)
                error(response.error as Any)
//                SwiftMessage.shared.showSomethingWentWrongMessage()
            }
        }
    }

}
