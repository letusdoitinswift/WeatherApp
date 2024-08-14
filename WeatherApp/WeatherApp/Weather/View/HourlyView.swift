//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/13/24.
//

import SwiftUI

struct HourlyView: View {
    @ObservedObject var dvm: HourlyViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hourly forecast")
                .fontWeight(.ultraLight)
                .textCase(.uppercase)
            ScrollView(.vertical) {
                LazyVStack(alignment: .center, spacing: 10) {
                    ForEach(dvm.dailyModel?.list ?? [], id: \.self) { each in
                        HourlyForecastView(day:
                                            DateTime.hourly(with: each.dt ?? 0),
                                          icon: each.weather.first?.icon ?? "10p",
                                          min: String(describing: each.main?.temp_min ?? 77.0),
                                          max: String(describing: each.main?.temp_max ?? 77.0),
                                          desc: String(describing: each.weather.first?.description ?? ""),
                                          feelsLike: String(describing: each.main?.feels_like ?? 88.0))
                        
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    HourlyView(dvm: HourlyViewModel(lat: 0.0, lon: 0.0))
}
