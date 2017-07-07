//
//  WeatherInfo.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit
import ObjectMapper

class WeatherInfo: Mappable {
    var mainWeatherInfo: MainWeatherInfo?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        mainWeatherInfo        <- map["main"]
    }
}
