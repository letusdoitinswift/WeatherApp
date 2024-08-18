//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/13/24.
//

import SwiftUI

struct HourlyView: View {
    @ObservedObject var hvm: HourlyViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hourly forecast")
                .fontWeight(.ultraLight)
                .textCase(.uppercase)
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 10) {
                    ForEach(hvm.hourlyModel?.list ?? [], id: \.self) { each in
                        HourlyForecastView(model: each)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    HourlyView(hvm: HourlyViewModel(lat: 0.0, lon: 0.0))
}
