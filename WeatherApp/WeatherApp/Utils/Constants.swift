//
//  Constants.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import Foundation

/// Constants to manage all the required urls.
struct Fetch {
    static var dailySecs = 86400
    static var eachHour = 3600
    static var unit: Unit { UnitKey.defaultValue }
    static var defaultCity = "Austin"
    static var defaultWeather: URL {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?units=\(unit)&APPID=\(appid)&q=\(defaultCity),us")!
        return url
    }

    private static let appid = "019ba229d67bcb745c7686df9fd2036e"
    private static let defaultLat = "37.323"
    private static let defaultLon = "122.0322"
    static var imageURL: (String) -> URL = { str in
        return URL(string: "https://openweathermap.org/img/wn/\(str).png")!
    }
    
    struct Defaults {
        static var keyForListOfWeatherCities = "DefaultsSearchKey"
        static func fetcExistingWeatherDetails() -> Array<String>? {
            do {
                let data = UserDefaults.standard.data(forKey: Fetch.Defaults.keyForListOfWeatherCities) ?? Data()
                return try JSONDecoder().decode(Array<String>.self, from: data)
            } catch {
                print("Something went wrong while performing fetcExistingWeatherDetails")
            }
            return nil
        }
    }
}

extension Fetch {
    static func using(zipOrCity: String, reqType: RequestType = .general) -> URL {
        switch zipOrCity.containsNumChars {
        case true:
			return URL(string: "https://api.openweathermap.org/geo/1.0/zip?units=\(unit)&zip=\(zipOrCity.performURLEncoding()),us&appid=\(appid)")!
        case false:
            print("Its a city: \(zipOrCity)")
			print("Its a city with encoding: \(zipOrCity.performURLEncoding())")
			return URL(string: "https://api.openweathermap.org/data/2.5/weather?units=\(unit)&APPID=\(appid)&q=\(zipOrCity.performURLEncoding()),us")!
        }
    }
    
    static func using(lat: Double, 
                      lon: Double,
                      reqType: RequestType = .general) -> URL {
        var urlString = ""
        switch reqType {
        case .general:
            urlString = "https://api.openweathermap.org/data/2.5/weather?units=\(unit)&lat=\(lat)&lon=\(lon)&appid=\(appid)"
        case .hourly(_):
            urlString = "api.openweathermap.org/data/2.5/forecast?units=\(unit)&lat=\(lat)&lon=\(lon)&appid=\(appid)"
        case .daily(let num):
            urlString = "https://api.openweathermap.org/data/2.5/forecast?units=\(unit)&lat=\(lat)&lon=\(lon)&appid=\(appid)&cnt=\(num)"
        }
        
		print(urlString)
        return URL(string: urlString)!
    }
}
