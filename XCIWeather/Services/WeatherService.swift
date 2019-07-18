//
//  WeatherService.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import Foundation

class WeatherService {
    
    static func getCurrentWeather(lat: Double, long: Double, completed: @escaping (_ jsonData: Data) -> Void) {
        let url = URL(string: String(format: ConstantHelper.baseWeatherApiUrl, lat, long, ConstantHelper.apiKey))!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            
            if let type = httpResponse.mimeType, type == "application/json",
                let data = data,
                let jsonData = String(data: data, encoding: .utf8) {
                
                DispatchQueue.main.async {
                    print(jsonData)
                    completed(data)
                }
            }
        }
        
        task.resume()
    }
    
}
