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
}
