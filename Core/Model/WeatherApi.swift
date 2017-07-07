//
//  WheatherApi.swift
//  demo
//
//  Created by Andrey Bobkov on 06.07.17.
//  Copyright © 2017 White Tiger Soft. All rights reserved.
//

import UIKit
import Alamofire;
import ObjectMapper

class WeatherApi: NSObject {
    open func loadWeather(handler: @escaping ((_ weatherInfo:WeatherInfo?) -> Swift.Void)) {
        let url = "http://api.openweathermap.org/data/2.5/weather" //TODO: extract base path
        let params: Parameters = [
            "q": "Moscow",
            "units": "Metric",
            "APPID": "386c84b131be0029376af7750c7cf17e" //TODO: extract to config
        ]
        Alamofire.request(url, parameters: params).responseJSON { response in
            let jsonData = response.result.value
            if (jsonData == nil) {
                handler(nil)
                return;
            }
            let weatherInfo = Mapper<WeatherInfo>().map(JSONObject: jsonData)
            handler(weatherInfo!)
        }
    }
}
