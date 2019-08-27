//
//  WeatherDataSource.swift
//  WiF
//
//  Created by Sujit Molleti on 1/16/19.
//  Copyright © 2019 Sujit Molleti. All rights reserved.
//

import Foundation

struct weather: Codable{
    let daily: Juice
    let currently: Currently
}

struct Juice: Codable{
    let data: [Hang]
}

struct Currently: Codable{
    let temperature: Double
}

struct Hang: Codable{
    let time: Int
    let precipProbability: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let apparentTemperatureHigh: Double
    let apparentTemperatureLow: Double
    let icon: String
}

struct WeatherDataSource{
    
    let urlString = "https://api.darksky.net/forecast/9666796d88812d25b0e62e870c084f54/40.7128,-74.0060"
    
    func getWeatherData(completion: @escaping (weather)-> ()) {
        guard let url = URL(string: "https://api.darksky.net/forecast/9666796d88812d25b0e62e870c084f54/40.7128,-74.0060") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response{
                print(response)
            }

            if let jsonData = data{
                print(jsonData)
                do{
                    let parsed = try JSONDecoder().decode(weather.self, from: jsonData)
                    completion(parsed)
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
                    //print(jsonData)
                    print(parsed)
                } catch{
                    print(error)
                }
            } else {
                print("something went wrong")
            }
        }.resume()
        
    }
    
    
}
