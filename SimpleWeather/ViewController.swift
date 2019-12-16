//
//  ViewController.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 14/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        WeatherLocationService.getLocationWeather(by: 523920) { (result) in
            print(result)
        }
    }


}

