//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/13/24.
//

import Foundation

@MainActor
class WeatherListViewModel: ObservableObject {
    let dispatchGroup = DispatchGroup()
    @Published var weatherModels: [WeatherModel]? = []
    @Published var errorModel: ErrorModel?
    @Published var pageLoaded: Bool = true
    
    var fetchSearchedStrings: Array<String>? {
        let data = UserDefaults.standard.object(forKey: Fetch.Defaults.keyForListOfWeatherCities)
        guard let strings: Array<String> =
                try? JSONDecoder().decode(Array<String>.self,
                                          from: data as? Data ?? Data()) else {
            return nil
        }
        print(strings)
        return strings
    }

    init() {
        let strings = fetchSearchedStrings ?? []
        Task {
            for string in strings {
                dispatchGroup.enter()
				pageLoaded = false
                let model: WeatherModel?
                (model, self.errorModel) = await Send<WeatherModel>().fetchWeather(using: string)
                if let model {
                    self.weatherModels?.append(model)
                }
				pageLoaded = true
                dispatchGroup.leave()
                
                dispatchGroup.notify(queue: DispatchQueue.main) {
                    self.pageLoaded = true
                }
            }
        }
    }
}
