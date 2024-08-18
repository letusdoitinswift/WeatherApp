//
//  CityWeatherCardView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/14/24.
//

import SwiftUI

struct CityWeatherCardView: View {
    @State var weatherModel: WeatherModel?
    @Environment (\.unit) var unit

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .fill(Color.blue)
                .frame(width: 350, height: 100)
                .background(Color.orange)
                .opacity(0.29)
                .background {
                    
                    LazyVStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(weatherModel?.name ?? "Austin").font(.title)
                                Text(DateTime.today()).font(.headline)
                            }
                            .padding([.top], 45)
                            .padding([.leading], 20)
                            Spacer()
                            Text("\(Int(weatherModel?.main?.temp ?? 77))\(unit.rawValue)").font(.system(size: 60))
                                .padding([.top], 45)
                                .padding([.trailing], 20)
                        }
                        Spacer()
                        HStack {
                            Text(weatherModel?.weather?.first?.description ?? "Unknown")
                                .padding([.leading], 20)
                                .padding([.bottom], 45)
                            Spacer()
                            Text("H:\(Int(weatherModel?.main?.temp_max ?? 79))\(unit.rawValue) L:\(Int(weatherModel?.main?.temp_min ?? 65))\(unit.rawValue)")
                                .padding([.bottom], 45)
                                .padding([.trailing], 20)
                        }
                    }.padding(.bottom, 20).padding(.top, 10)
                    
                }.foregroundColor(.red)
                .cornerRadius(20)
        }
    }
}

#Preview {
    CityWeatherCardView()
}
