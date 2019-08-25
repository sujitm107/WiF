//
//  WeatherScreen.swift
//  WiF
//
//  Created by Sujit Molleti on 1/15/19.
//  Copyright © 2019 Sujit Molleti. All rights reserved.
//

// key: 9666796d88812d25b0e62e870c084f54
// https://api.darksky.net/forecast/[key]/[latitude],[longitude]

/*
 Fixes:
 constraints: Date
 Instead of casting temps to int, try to round
 
 */

import UIKit

class WeatherScreen: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var weathers: [Weather] = []
    let api = WeatherDataSource();
    var parsedweather: [Hang] = []
    var currenttemp: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //    weathers = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        api.getWeatherData { (weather) in
            self.parsedweather = weather.daily.data
            self.currenttemp = weather.currently.temperature
            self.tableView.reloadData()
            
    //        print(self.parsedweather)
            
    //        print(self.parsedweather[3].temperatureHigh)

        }
        
        
    }
    
    
//
//    func createArray() -> [Weather]{
//
//        let weather2 = Weather(location: "Dayton, NJ", temperture: 32)
//        let weather1 = Weather(location: "New York", temperture: 15)
//        let weather3 = Weather(location: "Cupertino, CA", temperture: 50)
//
//       return[weather1, weather2, weather3]
//
//    }
    
}

extension WeatherScreen: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsedweather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     //   let weather = weathers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
//date
        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        dateFormatter.timeStyle = .none
        
        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(parsedweather[indexPath.row].time))
        let customFormat = "dMMM"
        
        
        let usLocale = Locale(identifier: "en_US")
        let usFormat = DateFormatter.dateFormat(fromTemplate: customFormat, options: 0, locale: usLocale)
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = usFormat

        // US English Locale (en_US)
//        dateFormatter.locale = Locale(identifier: "en_US")
//
        print(dateFormatter.string(from: date))
        
        
        
        cell.TemperatureLabel.text = formatter.string(from: date)
        cell.ApparentLabel.text = "AHi/ALo: "+String(Int(parsedweather[indexPath.row].temperatureHigh))+"/"+String(Int(parsedweather[indexPath.row].temperatureLow))
        cell.HighLowLabel.text = "Hi/Lo: "+String(Int(parsedweather[indexPath.row].apparentTemperatureHigh))+"/"+String(Int(parsedweather[indexPath.row].apparentTemperatureLow))
        
        cell.iconImage.image = UIImage(named: parsedweather[indexPath.row].icon)
        
      //  cell.setWeather(weather: weather)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
}

