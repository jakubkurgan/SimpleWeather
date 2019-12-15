//
//  WeatherPrediction.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 15/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

struct WeatherPrediction: Decodable {
    let id: Int
    let weatherStateName: String
    let weatherStateAbbr: String
    let windDirectionCompass: String
    let created: String
    let applicableDate: Date?
    let minTemp: Decimal
    let maxTemp: Decimal
    let theTemp: Decimal
    let windSpeed: Decimal
    let windDirection: Decimal
    let airPressure: Decimal
    let humidity: Decimal
    let visibility: Decimal
    let predictability: Decimal

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created = "created"
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity = "humidity"
        case visibility = "visibility"
        case predictability = "predictability"
    }
}
