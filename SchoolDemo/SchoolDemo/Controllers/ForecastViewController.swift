//
//  ForecastViewController.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var forecastTableView: UITableView!
    
    
    lazy var forecastService: ForecastService = ForecastService()
    var arrayOfDailyForecasts = [DailyForecast?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.register(UINib(nibName: "ForecastTableViewCell", bundle: nil), forCellReuseIdentifier: "forecastTableViewCell")
        forecastTableView.tableFooterView = UIView(frame: .zero)
        
        forecastService.retrieveNYCForecast {[unowned self] (arrayOfDailyForecasts) in
            print(arrayOfDailyForecasts)
            self.arrayOfDailyForecasts = arrayOfDailyForecasts
            DispatchQueue.main.async(execute: {
                self.forecastTableView.reloadData()
            })
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDailyForecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecastCell: ForecastTableViewCell = tableView.dequeueReusableCell(withIdentifier: "forecastTableViewCell", for: indexPath) as! ForecastTableViewCell
        if let dailyForecast = arrayOfDailyForecasts[indexPath.row] {
            forecastCell.dailyForecast = dailyForecast
        }
        return forecastCell
    }
}

