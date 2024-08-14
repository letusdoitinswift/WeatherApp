//
//  DefaultWeatherView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/11/24.
//

import SwiftUI

struct DefaultWeatherView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .stroke()
            .fill(Color.blue)
            .background {
                VStack {
                    Text("Cupertino")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                    Text("73°")
                        .font(.system(size: 60))
                    Text("Partly Cloudy")
                    HStack {
                        Text("H:78° L:58°")
                    }
                }
            }
            .frame(width: 150, height: 200)
    }
}

#Preview {
    DefaultWeatherView()
}
