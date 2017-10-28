//
//  ForecastService.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import Foundation

struct ForecastService {
    
    var constants = Constants()
    
    func retrieveNYCForecast(completion: @escaping ([DailyForecast]) -> Void) {
        
        // Prepare request url
        let clientID = constants.id
        let clientSecret = constants.secret
        let urlString = "https://api.aerisapi.com/forecasts/11101?client_id=" + clientID + "&client_secret=" + clientSecret
        guard let forecastURL = URL.init(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: forecastURL) { (data, urlResponse, error) in
            
            if urlResponse != nil {

                do {
                    guard let data = data else { return }
                    var arrayOfDailyForecasts = [DailyForecast]()
                    if let responseObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {

                        if let response = responseObject["response"] as? [[String: Any]] {

                            if let periodsArray = response[0]["periods"] as? [[String: Any]] {
                                //print(periodsArray)
                                for day in periodsArray {
                                    
                                    if let dailyForecast = DailyForecast(json: day) {
                                        arrayOfDailyForecasts.append(dailyForecast)
                                    }
                                }
                            }
                        }
                        completion(arrayOfDailyForecasts)
                    }
                    
                } catch let error {
                    print("Error occured: \(error)")
                }
                
            } else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()  
    }
    
}
