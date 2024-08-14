//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.

import SwiftUI

struct HourlyForecastView: View {
    var day: String
    var icon: String
    var min: String
    var max: String
    var desc: String
    var feelsLike: String
    @Environment (\.unit) var unit
    var body: some View {
        
        HStack(spacing: 10) {
            Text(day)
                .font(.caption)
                .frame(maxWidth: 50, maxHeight: 50)
            let image = icon
            AsyncImage(url: Fetch.imageURL(image))
                .frame(width: 40, height: 40)
                .background(Color.red)
            Text("\(min)\(unit.rawValue)")
                .font(.caption)
                .frame(maxWidth: 50, maxHeight: 50)
            Text("\(max)\(unit.rawValue)")
                .font(.caption)
                .frame(maxWidth: 60, maxHeight: 50)
            Text("\(feelsLike)\(unit.rawValue)")
                .font(.caption)
                .frame(maxWidth: 50, maxHeight: 50)
            Text(desc)
                .font(.caption)
                .frame(maxWidth: 60, maxHeight: 50)
        }
        .frame(maxWidth: 350, maxHeight: 100)
            .padding([.leading, .trailing], 20)
    }
}

#Preview {
    WeatherView(wvm: WeatherViewModel())
}

