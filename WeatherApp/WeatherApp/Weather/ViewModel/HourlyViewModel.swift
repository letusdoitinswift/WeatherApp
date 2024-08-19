//
//  HourlyViewModel.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/13/24.
//

import Foundation

class HourlyViewModel: ObservableObject {
    @Published var hourlyModel: HourlyModel?
    var wvm: WeatherViewModel?

    init(lat: Double, lon: Double) {
        let url = Fetch.using(lat: lat, lon: lon, reqType: RequestType.daily(100))
        let request = URLRequest(url: url)
        Send<HourlyModel>().networkReq(request) { model, err in
            DispatchQueue.main.async { [self] in
                self.hourlyModel = model
				self.wvm?.errorModel = err
            }
        }
    }
}
