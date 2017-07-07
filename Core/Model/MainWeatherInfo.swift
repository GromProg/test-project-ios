//
//  MainWeatherInfo.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit
import ObjectMapper

class MainWeatherInfo: Mappable {
    var temp:Double?
    var minTemp:Double? //temp_min
    var maxTemp:Double? ////temp_max
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        temp        <- map["temp"]
        minTemp     <- map["temp_min"]
        maxTemp     <- map["temp_max"]
    }
}
