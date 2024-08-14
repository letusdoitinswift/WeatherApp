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

struct ErrorModel: Decodable, Hashable {
    let cod: String?
    let message: String?
}

struct ZipCodeModel: Decodable, Hashable {
    let zip: String?
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
}

struct Day: Decodable, Hashable {
    let dt: Int?
    let main: Main?
    let sunrise: Int?
    let sunset: Int?
    struct Main: Decodable, Hashable {
        let temp: Double?
        let feels_like: Double?
        let temp_min: Double?
        let temp_max: Double
        let pressure: Int
        let humidity: Int
        let sea_level: Int
        let grnd_level: Int
        let temp_kf: Double
    }
    let weather: [Weather]
    struct Weather: Decodable, Hashable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    let clouds: Clouds
    struct Clouds: Decodable, Hashable {
        let all: Int
    }
    let wind: Wind
    struct Wind: Decodable, Hashable {
        let speed: Double
        let deg: Int
    }
    let visibility: Int
    let pop: Double
    let sys: Sys?
    struct Sys: Decodable, Hashable {
        let type: Int?
        let id: Int?
        let country: String?
        let sunrise: Int?
        let sunset: Int?
        let pod: String?
    }
    let dt_txt: String
    let rain: Rain?
    struct Rain: Decodable, Hashable {
        let threeH: Double?
    }
}

struct HourlyModel: Decodable, Hashable {
    let city: City?
    let cod: String?
    let message: Double?
    let cnt: Int?
    let list: [Day]
    let coord: Coord?
    struct Coord: Decodable, Hashable {
        let lon: Double?
        let lat: Double?
    }
    
    struct City: Decodable, Hashable {
        let id: Int?
        let name: String?
        let coord: Coord?
        struct Coord: Decodable, Hashable {
            let lon: Double?
            let lat: Double?
        }
        let country: String?
        let population: Int?
        let timezone: Int?
        let sunrise: Int?
        let sunset: Int?
    }
}
