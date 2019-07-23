//
//  UserDefaultsHelper.swift
//  XCIWeather
//
//  Created by Dmytro on 7/23/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

class SettingsHelper {
    private static let tempUnitsKey = "tempUnits"
    private static let pressureUnitsKey = "pressureUnits"
    private static let speedUnitsKey = "speedUnits"
    
    static var tempUnits: String {
        get {
            return UserDefaults.standard.string(forKey: tempUnitsKey) ?? "Celsius"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tempUnitsKey)
        }
    }
    
    static var pressureUnits: String {
        get {
            return UserDefaults.standard.string(forKey: pressureUnitsKey) ?? "hPa"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: pressureUnitsKey)
        }
    }
    
    static var speedUnits: String {
        get {
            return UserDefaults.standard.string(forKey: speedUnitsKey) ?? "km/h"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: speedUnitsKey)
        }
    }
    
    static func getTempInUnits(kelvinTemp: Double) -> String {
        switch (tempUnits) {
        case "Celsius":
            return "\(Int(kelvinTemp - 273.15))"
        case "Fahrenheit":
            return "\(Int(((kelvinTemp - 273.15) * 1.8) + 32))"
        default:
            return "\(Int(kelvinTemp))"
        }
    }
    
    static func getPressureInUnits(hPaPressure: Double) -> String {
        switch (pressureUnits) {
        case "hPa":
            return "\(Int(hPaPressure))"
        case "inHg":
            // leave 2 decimal places for sufficient precicion
            return String(format: "%.2f", hPaPressure * 0.02953)
        default:
            return "\(Int(hPaPressure))"
        }
    }
    
    static func getSpeedInUnits(mpsSpeed: Double) -> String {
        switch (speedUnits) {
        case "km/h":
            return "\(Int(mpsSpeed * 3.6))"
        case "mph":
            return "\(Int(mpsSpeed * 2.237))"
        case "kts":
            return "\(Int(mpsSpeed * 1.94384))"
        default:
            return "\(Int(mpsSpeed))"
        }
    }
}
