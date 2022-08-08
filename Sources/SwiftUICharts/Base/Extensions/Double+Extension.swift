//
//  File.swift
//  
//
//  Created by Issa Mansour on 2021-09-25.
//

import Foundation

extension Double {
    func toCurrency(_ currencyCode: String, maximumFractionDigits: Int? = nil) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = currencyCode
        formatter.usesGroupingSeparator = true

        if self < 1.0 {
            formatter.usesSignificantDigits = true
            formatter.minimumSignificantDigits = 2
            formatter.maximumSignificantDigits = 4
        }

        if let maximumFractionDigits = maximumFractionDigits {
            formatter.maximumFractionDigits = maximumFractionDigits
        }

        let result = formatter.string(from: self as NSNumber)

        switch currencyCode {
            case "◎":
                return String(self) + " ◎"
            case "":
                return String(format: "%.0f", self) // Mostly to remove decimal (Int cases)
            default:
                return result ?? String(self)
        }
    }
}
