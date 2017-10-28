//
//  ForecastViewController.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    lazy var forecastService: ForecastService = ForecastService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastService.retrieveNYCForecast { (arrayOfDailyForecasts) in
            print(arrayOfDailyForecasts)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

