//
//  WeatherCell.swift
//  WiF
//
//  Created by Sujit Molleti on 1/15/19.
//  Copyright © 2019 Sujit Molleti. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var HighLowLabel: UILabel!
    @IBOutlet weak var ApparentLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    func setWeather(weather: Weather){
        TemperatureLabel.text = String(weather.temperture)
        HighLowLabel.text = String(weather.High)
        ApparentLabel.text = String(weather.ApparentLow)
    }

}
