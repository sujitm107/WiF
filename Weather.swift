//
//  Weather.swift
//  WiF
//
//  Created by Sujit Molleti on 1/15/19.
//  Copyright © 2019 Sujit Molleti. All rights reserved.
//

import Foundation
import UIKit

class Weather{
    var High: Double
    var temperture: Double
    var Low: Double
    var ApparentHigh: Double
    var ApparentLow: Double
    
    init(High: Double, temperture: Double, Low: Double, ApparentHigh: Double, ApparentLow: Double){
        self.High = High
        self.temperture = temperture
        self.Low = Low
        self.ApparentLow = ApparentLow
        self.ApparentHigh = ApparentHigh
        
    }
}
