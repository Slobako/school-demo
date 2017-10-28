//
//  DailyForecast.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import Foundation

struct DailyForecast {
    let dateTimeISO: String?
    let maxTempF: Int?
    let minTempF: Int?
    let icon: String?
}

extension DailyForecast {
    
    init?(json: [String: Any]) {
        guard let dateTimeISO = json["dateTimeISO"] as? String,
            let maxTempF = json["maxTempF"] as? Int,
            let minTempF = json["minTempF"] as? Int,
            let icon = json["icon"] as? String
            else { return nil }
        
        self.dateTimeISO = dateTimeISO
        self.maxTempF = maxTempF
        self.minTempF = minTempF
        self.icon = icon
    }
}

