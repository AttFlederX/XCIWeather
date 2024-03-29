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
        
        getJsonData(url: url, completed: completed)
    }
    
    static func getForecast(lat: Double, long: Double, completed: @escaping (_ jsonData: Data) -> Void) {
        let url = URL(string: String(format: ConstantHelper.baseWeatherApiForecastUrl, lat, long, ConstantHelper.apiKey))!
        
        getJsonData(url: url, completed: completed)
    }
    
    
    static private func getJsonData(url: URL, completed: @escaping (_ jsonData: Data) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Response null")
                return
            }
            
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
