//
//  ForecastItemCodable.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

struct ForecastItemCodable : Codable {
    let dt: Int
    let main: MainCodable
    let weather: [WeatherCodable]
    let clouds: CloudsCodable
    let wind: WindCodable
}
