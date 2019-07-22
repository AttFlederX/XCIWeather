//
//  ForecastCodable.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

struct ForecastCodable : Codable {
    let list: [ForecastItemCodable]
    let city: CityCodable
}
