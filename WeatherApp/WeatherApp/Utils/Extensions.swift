//
//  Extensions.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/11/24.
//

import Foundation
import SwiftUI

extension String {
    var containsNumChars: Bool {
        var hasADigit = false
        self.forEach { char in
            hasADigit = char.isWholeNumber ? true : false
        }
        print("\(self) hasDigits \(hasADigit)")
        return hasADigit
    }
}

extension EnvironmentValues {
    var unit: Unit {
        get { self[UnitKey.self] }
        set { self[UnitKey.self] = newValue }
    }
}

struct UnitKey: EnvironmentKey {
    static var defaultValue = Unit.imperial
}
