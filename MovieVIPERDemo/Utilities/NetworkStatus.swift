//
//  NetworkStatus.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import Foundation
import UIKit

enum Connection: String {
    case wifi = "w"
    case cellular = "m"
    
}

struct ConnectionType {
    var network = String()
    var speed = String()
    
    init(connection: Connection) {
        switch connection {
            
        case .wifi:
            network = connection.rawValue
            speed = "fast"
        case .cellular:
            network = connection.rawValue
            speed = "slow"
        }
        
    }
}

class NetworkStatus: NSObject {
    
    static let shared = NetworkStatus()
    
    func isPresent() -> Bool {
        return Network.reachability?.isReachable ?? false
    }
    
    var isCellularPresent: Bool {
        return Network.reachability?.isReachableOnWWAN ?? false
    }
    
    
    func getNetworkType() -> ConnectionType? {
        
        if (Network.reachability?.isReachableOnWWAN ?? false) && (Network.reachability?.isWWAN ?? false) {
            return ConnectionType(connection: .cellular)
        }
        
        if Network.reachability?.isReachableViaWiFi ?? false {
            return ConnectionType(connection: .wifi)
        }
        
        return nil
    }
}
