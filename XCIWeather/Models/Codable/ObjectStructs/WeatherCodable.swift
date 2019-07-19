//
//  WeatherCodable.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

struct WeatherCodable: Codable {
    let id: Int
    let description: String
    let icon: String
}
