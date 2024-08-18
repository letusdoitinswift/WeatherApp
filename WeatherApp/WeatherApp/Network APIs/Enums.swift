//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

/// Masks the incoming erorr and shares more readable errors to show on the UI
enum NetworkError: Error {
    case BadResponse
    case BusinessError
    case TimedOut
    case RequestedDataNotFound
}

/// For handling units.
enum Unit: String {
    case imperial = "°"
    case metric = "°C"
}

/// For handling different types of requests.
enum RequestType {
    case hourly(Int)
    case daily(Int)
    case general
}

// Gets the correct image for the background
enum WeatherBGType: String {
    case brokenClouds
    case clearSky
    case fewClouds
    case lightRain
    case moderateRain
    case overcastClouds
    case scatteredClouds
    case thunderstorm
    case none
    
    static func getStringFor(str: String) -> Self {
        if str.contains("broken") {
            return .brokenClouds
        }
        if str.contains("clear") {
            return .clearSky
        }
        if str.contains("few") {
            return .fewClouds
        }
        if str.contains("light") {
            return .lightRain
        }
        if str.contains("moderate") {
            return .moderateRain
        }
        if str.contains("overcast") {
            return .overcastClouds
        }
        if str.contains("scattered") {
            return .scatteredClouds
        }
        if str.contains("thunderstorm") {
            return .thunderstorm
        }
        return .none
    }
}
