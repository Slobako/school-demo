//
//  ForecastTableViewCell.swift
//  SchoolDemo
//
//  Created by Slobodan Kovrlija on 10/27/17.
//  Copyright © 2017 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    // MARK: - Properties
    var forecastCellVM: ForecastCellViewModel? {
        didSet {
            dateLabel.text = forecastCellVM?.date
            maxTempLabel.text = forecastCellVM?.maxTemp
            minTempLabel.text = forecastCellVM?.minTemp
            iconImageView.image = UIImage.init(named: forecastCellVM?.iconName ?? "default_icon")
        }
    }
    
//    var dailyForecast: DailyForecast? {
//        
//        didSet {
//            if let dateTimeISO = dailyForecast?.dateTimeISO {
//                dateLabel.text = dateTimeISO
//            }
//            if let maxTempF = dailyForecast?.maxTempF {
//                maxTempLabel.text = String(maxTempF)
//            }
//            if let minTempF = dailyForecast?.minTempF {
//                minTempLabel.text = String(minTempF)
//            }
//            if let icon = dailyForecast?.icon {
//                iconImageView.image = UIImage.init(named: icon)
//            }
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
