//
//  SysCodable.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

struct SysCodable : Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}
