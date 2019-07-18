//
//  ForecastViewController.swift
//  XCIWeather
//
//  Created by Dmytro on 6/20/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {

    @IBOutlet weak var forecastTableVIew: UITableView!
    
    var forecastData: [Forecast] = []
    var dateSections: [Date] = []
    var groupedForecastData: [(key: Date, value: [Forecast])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        forecastData = getForecastData().sorted(by: { $0.dateTime < $1.dateTime })
        groupedForecastData = Dictionary(grouping: forecastData, by: { fcd in fcd.dateTime.truncateDate() })
            .sorted(by: { $0.key < $1.key })
        //dateSections = Array(groupedForecastData.keys) // move keys into an ordered list
    }
    
    func getForecastData() -> [Forecast] {
        var mockData: [Forecast] = []
        
        mockData.append(Forecast(dateTime: Date(timeIntervalSinceNow: 1000), weatherConditionsStatus: #imageLiteral(resourceName: "weather_01d"), weatherConditionsDescription: "Clear", temperature: 85, pressure: 29.92, humidity: 58, windSpeed: 15, cloudCoverage: 5))
        
        mockData.append(Forecast(dateTime: Date(timeIntervalSinceNow: 2000), weatherConditionsStatus: #imageLiteral(resourceName: "weather_04d"), weatherConditionsDescription: "Light clouds", temperature: 85, pressure: 29.92, humidity: 58, windSpeed: 15, cloudCoverage: 5))
        
        mockData.append(Forecast(dateTime: Date(timeIntervalSince1970: 575000000), weatherConditionsStatus: #imageLiteral(resourceName: "weather_03n"), weatherConditionsDescription: "Overcast", temperature: 85, pressure: 29.92, humidity: 58, windSpeed: 15, cloudCoverage: 5))
        
        return mockData
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
