//
//  String+Extension.swift
//  SimpleWeather
//
//  Created by Jakub Kurgan on 15/12/2019.
//  Copyright © 2019 Jakub Kurgan. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
    }
}
