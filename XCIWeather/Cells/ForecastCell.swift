//
//  ForecastCell.swift
//  XCIWeather
//
//  Created by Dmytro on 6/20/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var weatherConditionsImageView: UIImageView!
    @IBOutlet weak var weatherConditionsLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var cloudCoverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setForecastCellData(forecastData: Forecast) {
        timeLabel.text = forecastData.dateTime.toString(dateFormat: "hh:mm");
        
        weatherConditionsImageView.image = forecastData.weatherConditionsStatus
        weatherConditionsLabel.text = forecastData.weatherConditionsDescription
        temperatureLabel.text = String(format: "%d° F", forecastData.temperature)
        
        pressureLabel.text = String(format: "%.2f inHg", forecastData.pressure)
        humidityLabel.text = String(format: "%d%%", forecastData.humidity)
        windLabel.text = String(format: "%d kts", forecastData.windSpeed)
        cloudCoverageLabel.text = String(format: "%d%%", forecastData.cloudCoverage)
    }
}
