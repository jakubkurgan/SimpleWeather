//
//  DateFormatter+Extension.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 16/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var dateOnly: DateFormatter {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        return formater
    }
}
