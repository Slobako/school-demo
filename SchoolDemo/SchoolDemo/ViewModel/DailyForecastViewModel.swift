//
//  DailyForecastViewModel.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 3/25/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import Foundation

class DailyForecastViewModel {
    
    var reloadTableViewClosure: (()->())?
    
    var cellViewModels: [ForecastCellViewModel] = [ForecastCellViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }
    
    var numberOfRows: Int {
        return cellViewModels.count
    }
    
    let forecastService: ForecastService
    
    init(forecastService: ForecastService = ForecastService()) {
        self.forecastService = forecastService
    }
    
    var arrayOfDailyForecasts = [DailyForecast?]()
    
    func fetchForecasts() {
        forecastService.retrieveNYCForecast {[unowned self] (arrayOfDailyForecasts) in
            print(arrayOfDailyForecasts)
            self.arrayOfDailyForecasts = arrayOfDailyForecasts
            var cellViewModelsArray = [ForecastCellViewModel]()
            for dailyForecast in arrayOfDailyForecasts {
                let forecastCellVM = self.createForecastCellViewModel(dailyForecast: dailyForecast)
                cellViewModelsArray.append(forecastCellVM)
            }
            self.cellViewModels = cellViewModelsArray
        }
    }
    
    func getCellViewModel(at indexPath: IndexPath ) -> ForecastCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func createForecastCellViewModel(dailyForecast: DailyForecast) -> ForecastCellViewModel {
        
        let date = dailyForecast.dateTimeISO ?? ""
        let maxTemp = String(dailyForecast.maxTempF ?? 0)
        let minTemp = String(dailyForecast.minTempF ?? 0)
        let iconName = dailyForecast.icon ?? ""
        
        let forecastCellVM = ForecastCellViewModel(date: date,
                                                   iconName: iconName,
                                                   minTemp: minTemp,
                                                   maxTemp: maxTemp)
        
        return forecastCellVM
    }
}
