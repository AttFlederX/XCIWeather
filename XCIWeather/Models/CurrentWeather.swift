//
//  CurrentWeather.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeather {
    
    // MARK: Fields
    
    var location: String
    var dateTime: Date
    
    var weatherConditionsStatus: UIImage
    var weatherConditionsDescription: String
    var temperature: Double
    
    var pressure: Double
    var humidity: Int
    var windHeading: Double
    var windSpeed: Double
    var cloudCoverage: Int
    
    var sunriseTime: Date
    var sunsetTime: Date
    
    var dateTimeString: String {
        return dateTime.toString(dateFormat: "MMM dd yyyy, HH:mm")
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
        return "\(Int(windHeading))° @ \(SettingsHelper.getSpeedInUnits(mpsSpeed: windSpeed)) \(SettingsHelper.speedUnits)"
    }
    
    var cloudCoverageString: String {
        return "\(cloudCoverage)%"
    }
    
    var sunriseTimeString: String {
        return sunriseTime.toString(dateFormat: "HH:mm ff")
    }
    
    var sunsetTimeString: String {
        return sunsetTime.toString(dateFormat: "HH:mm ff")
    }
    
    init(location: String,
         dateTime: Date,
         weatherConditionsStatus: UIImage,
         weatherConditionsDescription: String,
         temperature: Double,
         pressure: Double,
         humidity: Int,
         windHeading: Double,
         windSpeed: Double,
         cloudCoverage: Int,
         sunriseTime: Date,
         sunsetTime: Date) {
        
        self.location = location
        self.dateTime = dateTime
        
        self.weatherConditionsStatus = weatherConditionsStatus
        self.weatherConditionsDescription = weatherConditionsDescription
        self.temperature = temperature
        
        self.pressure = pressure
        self.humidity = humidity
        self.windHeading = windHeading
        self.windSpeed = windSpeed
        self.cloudCoverage = cloudCoverage
        
        self.sunriseTime = sunriseTime
        self.sunsetTime = sunsetTime
    }
}
