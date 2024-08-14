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
