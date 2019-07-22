//
//  CurrentViewController.swift
//  XCIWeather
//
//  Created by Dmytro on 7/18/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class CurrentViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var updateTimeLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudCoverageLabel: UILabel!
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    let decoder = JSONDecoder();
    
    var currentWeatherData: CurrentWeather? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateWeatherData),
                                               name: .locationUpdated,
                                               object: nil)
    }
    
    
    
    @objc private func updateWeatherData() {
        WeatherService.getCurrentWeather(lat: LocationService.currentLocationLatitude, long: LocationService.currentLocationLongitude,
                                         completed: {jsonData in
                                            do {
                                                let modelData = try self.decoder.decode(CurrentWeatherCodable.self, from: jsonData)
                                                
                                                // convert to DTO model
                                                self.currentWeatherData = CurrentWeather(
                                                    location: "\(modelData.name), \(modelData.sys.country)",
                                                    dateTime: Date(timeIntervalSince1970: TimeInterval(modelData.dt)),
                                                    weatherConditionsStatus: UIImage(named: "weather_\(modelData.weather.first?.icon ?? "01_d")")!,
                                                    weatherConditionsDescription: modelData.weather.first!.description,
                                                    temperature: modelData.main.temp,
                                                    pressure: modelData.main.pressure,
                                                    humidity: modelData.main.humidity,
                                                    windHeading: modelData.wind.deg ?? 0,
                                                    windSpeed: modelData.wind.speed,
                                                    cloudCoverage: modelData.clouds.all,
                                                    sunriseTime: Date(timeIntervalSince1970: TimeInterval(modelData.sys.sunrise))
                                                        .toTimeZone(utcOffset: modelData.timezone),
                                                    sunsetTime: Date(timeIntervalSince1970: TimeInterval(modelData.sys.sunset))
                                                        .toTimeZone(utcOffset: modelData.timezone))
                                                
                                                self.updateWeatherUi(data: self.currentWeatherData!)
                                            }
                                            catch let error {
                                                print("Failed to parse JSON: \(error.localizedDescription)")
                                            }
                                        })
    }

    
    func updateWeatherUi(data: CurrentWeather) {
        locationLabel.text = data.location
        temperatureLabel.text = data.temperatureString
        conditionLabel.text = data.weatherConditionsDescription
        conditionImage.image = data.weatherConditionsStatus
        updateTimeLabel.text = data.dateTimeString
        
        pressureLabel.text = data.pressureString
        humidityLabel.text = data.humidityString
        windLabel.text = data.windString
        cloudCoverageLabel.text = data.cloudCoverageString
        
        sunriseLabel.text = data.sunriseTimeString
        sunsetLabel.text = data.sunsetTimeString
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
