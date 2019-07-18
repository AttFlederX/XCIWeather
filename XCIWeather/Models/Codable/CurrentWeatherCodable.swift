//
//  CurrentWeatherCodable.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

struct CurrentWeatherCodable : Codable {
    let weather: [WeatherCodable]
    let main: MainCodable
    let wind: WindCodable
    let clouds: CloudsCodable
    let dt: Int
    let sys: SysCodable
    let timezone: Int
    let name: String
}
