//
//  NotificationNames.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

extension Notification.Name {
    static var locationUpdated: Notification.Name {
        return .init(rawValue: "LocationService.locationUpdated")
    }
    
    static var pickerRequested: Notification.Name {
        return .init(rawValue: "SettingsTableViewController.pickerRequested")
    }
}
