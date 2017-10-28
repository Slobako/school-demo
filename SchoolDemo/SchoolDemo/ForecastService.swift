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
    
    func retrieveNYCForecast(completion: @escaping ([String]) -> Void) {
        
        // Prepare request url
        let clientID = constants.id
        let clientSecret = constants.secret
        let urlString = "https://api.aerisapi.com/forecasts/11101?client_id=" + clientID + "&client_secret=" + clientSecret
        guard let forecastURL = URL.init(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: forecastURL) { (data, urlResponse, error) in
            
            if urlResponse != nil {
                do {
                    guard let data = data else { return }
                    if let responseObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        print(responseObject)
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
