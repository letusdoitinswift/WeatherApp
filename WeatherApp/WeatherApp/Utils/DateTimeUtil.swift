//
//  DateTimeUtil.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

struct DateTime {
    private init() {}
    static var shared: DateTime = DateTime()
    var date: String = "\(Date().formatted(date: .abbreviated, time: .standard))"
}
