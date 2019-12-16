//
//  LocationWeather.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 16/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct LocationWeather: Decodable {
    let consolidatedWeather: [ConsolidatedWeather]
    let title: String
    let locationType: String
    let woeid: Int
    
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case title = "title"
        case locationType = "location_type"
        case woeid = "woeid"
    }
}
