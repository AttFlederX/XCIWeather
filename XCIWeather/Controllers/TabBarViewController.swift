//
//  TabBarViewController.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TabBarViewController: UITabBarController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Location service setup
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
            locationManager.startUpdatingLocation()
        }
        
    }
    
    // MARK: Location delegate callbacks
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let curLocation = manager.location?.coordinate else {
            return
        }
        // this methods also posts an observer event for relevant view controllers
        LocationService.updateLocation(lat: curLocation.latitude, long: curLocation.longitude)
    }
}
