//
//  LocationService.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation
import MapKit


class LocationService {
    
    static var currentLocationLatitude: Double = 0
    static var currentLocationLongitude: Double = 0
    
    
    static func updateLocation(lat: Double, long: Double) {
        currentLocationLatitude = lat
        currentLocationLongitude = long
        
        NotificationCenter.default.post(name: .locationUpdated, object: nil)
    }
}
