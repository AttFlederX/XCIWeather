//
//  Forecast.swift
//  XCIWeather
//
//  Created by Dmytro on 6/20/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation
import UIKit

class Forecast {
    
    // MARK: Fields
    
    var dateTime: Date
    
    var weatherConditionsStatus: UIImage
    var weatherConditionsDescription: String
    var temperature: Int
    
    var pressure: Double
    var humidity: Int
    var windSpeed: Int
    var cloudCoverage: Int
    
    init(dateTime: Date,
         weatherConditionsStatus: UIImage,
         weatherConditionsDescription: String,
         temperature: Int,
         pressure: Double,
         humidity: Int,
         windSpeed: Int,
         cloudCoverage: Int) {
        
        self.dateTime = dateTime

        self.weatherConditionsStatus = weatherConditionsStatus
        self.weatherConditionsDescription = weatherConditionsDescription
        self.temperature = temperature

        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.cloudCoverage = cloudCoverage
        
    }
}
