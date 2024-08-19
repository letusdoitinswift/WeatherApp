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
				.fill(Color.blue.opacity(0.2))
                .frame(width: 350, height: 100)
                .background(Color.white)
                .opacity(0.2)
                .background {
                    VStack {
                        RoundedRectangleBGView(weatherModel: $weatherModel)
                    }.padding(.bottom, 20).padding(.top, 10)
                    
				}.foregroundColor(.blue).opacity(7)
                .cornerRadius(20)
			
        }
    }
}

#Preview {
    CityWeatherCardView()
}
