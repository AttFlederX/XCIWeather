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
    var temperature: Double
    
    var pressure: Double
    var humidity: Int
    var windSpeed: Double
    var cloudCoverage: Int
    
    var dateTimeString: String {
        return dateTime.toString(dateFormat: "HH:mm")
    }
    
    var temperatureString: String {
        return "\(SettingsHelper.getTempInUnits(kelvinTemp: temperature))° \(SettingsHelper.tempUnits.prefix(1))"
    }
    
    var pressureString: String {
        return "\(SettingsHelper.getPressureInUnits(hPaPressure: pressure)) \(SettingsHelper.pressureUnits)"
    }
    
    var humidityString: String {
        return "\(humidity)%"
    }
    
    var windString: String {
        return "\(SettingsHelper.getSpeedInUnits(mpsSpeed: windSpeed)) \(SettingsHelper.speedUnits)"
    }
    
    var cloudCoverageString: String {
        return "\(cloudCoverage)%"
    }
    
    init(dateTime: Date,
         weatherConditionsStatus: UIImage,
         weatherConditionsDescription: String,
         temperature: Double,
         pressure: Double,
         humidity: Int,
         windSpeed: Double,
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
