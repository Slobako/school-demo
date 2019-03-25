//
//  ForecastViewController.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: IBOutlets
    @IBOutlet weak var forecastTableView: UITableView!
    
    //lazy var forecastService: ForecastService = ForecastService()
    //var arrayOfDailyForecasts = [DailyForecast?]()
    
    lazy var dailyForecastViewModel: DailyForecastViewModel = {
        return DailyForecastViewModel()
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.register(UINib(nibName: "ForecastTableViewCell", bundle: nil),
                                   forCellReuseIdentifier: "forecastTableViewCell")
        forecastTableView.tableFooterView = UIView(frame: .zero)
        
        forecastTableView.estimatedRowHeight = 150
        forecastTableView.rowHeight = UITableView.automaticDimension
        
        initViewModel()
    }
    
    func initViewModel() {
        
        dailyForecastViewModel.fetchForecasts()
        
        dailyForecastViewModel.reloadTableViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.forecastTableView.reloadData()
            }
        }
        
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForecastViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecastCell: ForecastTableViewCell = tableView.dequeueReusableCell(withIdentifier: "forecastTableViewCell", for: indexPath) as! ForecastTableViewCell
        
        let cellVM = dailyForecastViewModel.getCellViewModel(at: indexPath)
        forecastCell.forecastCellVM = cellVM
        
        return forecastCell
    }
}

