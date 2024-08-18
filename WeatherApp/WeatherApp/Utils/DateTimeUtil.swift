//
//  DateTimeUtil.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

/// This helps in showing date time in the app.
struct DateTime {
    static func getCurrentMonth() -> String {
        let dateFormat = DateFormatter()
        dateFormat.setLocalizedDateFormatFromTemplate("MMMM")

        return dateFormat.string(from: Date())
    }

    static func getOrdinalString() -> String {
        let dateFormat = DateFormatter()
        dateFormat.setLocalizedDateFormatFromTemplate("d")

        return NumberUtil
            .numberOrdinal(for: Int(
                dateFormat.string(from: Date())
            ) ?? 1)
    }

    static func getDayOfTheWeek() -> String {
        let dateFormat = DateFormatter()
        dateFormat.setLocalizedDateFormatFromTemplate("EEEE")
        return dateFormat.string(from: Date())
    }

    static func getShortDayOfTheWeek(for date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.setLocalizedDateFormatFromTemplate("EEE")

        return dateFormat.string(from: Date())
    }

    static func hourly(with diff: Int) -> String {
        let dateFormat = DateFormatter()
        dateFormat.amSymbol = "AM"
        dateFormat.pmSymbol = "PM"
        dateFormat.timeStyle = .short
        dateFormat.dateFormat = "M/d ha"
        let date = Date(timeIntervalSince1970: TimeInterval(diff))
        return dateFormat.string(from: date)
    }
    
    static func today() -> String {
        let dateFormat = DateFormatter()
        dateFormat.timeStyle = .short
        dateFormat.dateFormat = "M/d"
        let date = Date()
        return dateFormat.string(from: date)
    }
    

    static func days(with diff: Int) -> String {
        let dateFormat = DateFormatter()
        dateFormat.timeStyle = .short
        dateFormat.dateFormat = "EEE"
        dateFormat.timeZone = TimeZone.current
        let date = Date(timeIntervalSince1970: TimeInterval(diff))
        return dateFormat.string(from: date)
    }

    static func provideFinalDisplayDate() -> String {
        getCurrentMonth() + " " + getOrdinalString() + ", " + getDayOfTheWeek()
    }
}

private struct NumberUtil {
    static func numberOrdinal(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal

        return numberFormatter
            .string(from: NSNumber(integerLiteral: number)) ?? "th"
    }
}
