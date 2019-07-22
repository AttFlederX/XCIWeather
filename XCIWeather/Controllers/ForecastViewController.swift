//
//  ForecastViewController.swift
//  XCIWeather
//
//  Created by Dmytro on 6/20/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var forecastTableView: UITableView!
    
    let decoder = JSONDecoder();
    
    var forecastData: [Forecast] = []
    var dateSections: [Date] = []
    var groupedForecastData: [(key: Date, value: [Forecast])] = []
    
    var isInitDataReceived: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // remove footer
        forecastTableView.tableFooterView = UIView(frame: .zero)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateForecastData),
                                               name: .locationUpdated,
                                               object: nil)
        
        if !isInitDataReceived {
            updateForecastData()
        }
    }
    

    @objc private func updateForecastData() {
        WeatherService.getForecast(lat: LocationService.currentLocationLatitude, long: LocationService.currentLocationLongitude,
                                         completed: {jsonData in
                                            do {
                                                let modelData = try self.decoder.decode(ForecastCodable.self, from: jsonData)
                                                
                                                // convert to DTO model
                                                self.forecastData = []
                                                
                                                for forecastItem in modelData.list {
                                                    
                                                    self.forecastData.append(Forecast(
                                                        dateTime: Date(timeIntervalSince1970: TimeInterval(forecastItem.dt))
                                                            .toTimeZone(utcOffset: modelData.city.timezone),
                                                        weatherConditionsStatus: UIImage(named: "weather_\(forecastItem.weather.first?.icon ?? "01_d")")!,
                                                        weatherConditionsDescription: forecastItem.weather.first!.description,
                                                        temperature: forecastItem.main.temp,
                                                        pressure: forecastItem.main.pressure,
                                                        humidity: forecastItem.main.humidity,
                                                        windSpeed: forecastItem.wind.speed,
                                                        cloudCoverage: forecastItem.clouds.all))
                                                    
                                                }
                                                
                                                self.updateForecastUi()
                                                
                                                if (!self.isInitDataReceived) {
                                                    self.isInitDataReceived = true
                                                }
                                            }
                                            catch let error {
                                                print("Failed to parse JSON: \(error.localizedDescription)")
                                            }
        })
    }
    
    func updateForecastUi() {
        forecastData = forecastData.sorted(by: { $0.dateTime < $1.dateTime })
        groupedForecastData = Dictionary(grouping: forecastData, by: { fcd in fcd.dateTime.truncateDate() })
            .sorted(by: { $0.key < $1.key })
        
        forecastTableView.reloadData()
    }

}

extension ForecastViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (groupedForecastData[section].value).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecastItem =  (groupedForecastData[indexPath.section].value)[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastCell
        
        cell.setForecastCellData(forecastData: forecastItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "DateHeaderCell") as! DateHeaderCell
        
        headerCell.setHeaderCellData(date: groupedForecastData[section].key)
        
        return headerCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupedForecastData.count;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
}
