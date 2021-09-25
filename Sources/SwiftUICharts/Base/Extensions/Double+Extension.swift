//
//  File.swift
//  
//
//  Created by Issa Mansour on 2021-09-25.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.usesGroupingSeparator = true

        if self < 1.0 {
            formatter.usesSignificantDigits = true
            formatter.minimumSignificantDigits = 2
            formatter.maximumSignificantDigits = 4
        }

        let result = formatter.string(from: self as NSNumber)
        return result ?? String(self)
    }
}
