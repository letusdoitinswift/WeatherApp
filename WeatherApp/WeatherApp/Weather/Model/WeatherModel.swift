//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

struct WeatherModel: Decodable, Hashable {
    let coord: Coordinate?
    let weather: [Weather]?
    let base: String?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let sys: Sys?
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?

    struct Coordinate: Decodable, Hashable {
        let lon: Double?
        let lat: Double?
    }
    struct Weather: Decodable, Hashable {
        let id: Int?
        let main: String?
        let description: String?
        let icon: String?
    }
    struct Main: Decodable, Hashable {
        let temp: Double?
        let feels_like: Double?
        let temp_min: Double?
        let temp_max: Double?
        let pressure: Int?
        let humidity: Int?
        let sea_level: Int?
        let grnd_level: Int?
    }
    struct Wind: Decodable, Hashable {
        let speed: Double?
        let deg: Int?
    }
    struct Clouds: Decodable, Hashable {
        let all: Int?
    }
    struct Sys: Decodable, Hashable {
        let type: Int?
        let id: Int?
        let country: String?
        let sunrise: Int?
        let sunset: Int?
    }
}

