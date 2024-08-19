//
//  CityWeatherCardView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/14/24.
//

import SwiftUI

struct CityWeatherCardView: View {
    @State var weatherModel: WeatherModel?
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(Color.blue)
                .frame(width: 350, height: 100)
                .background(Color.orange)
                .opacity(0.29)
                .background {
                    VStack {
                        RoundedRectangleBGView(weatherModel: $weatherModel)
                    }.padding(.bottom, 20).padding(.top, 10)
                    
                }.foregroundColor(.red)
                .cornerRadius(20)
        }
    }
}

#Preview {
    CityWeatherCardView()
}
