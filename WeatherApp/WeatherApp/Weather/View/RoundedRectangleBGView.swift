//
//  RoundedRectangleBGView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/17/24.
//

import SwiftUI

struct RoundedRectangleBGView: View {
	@Binding var weatherModel: WeatherModel?
	@Environment (\.unit) var unit
    var body: some View {
		ZStack {
			ZStack {
				AsyncImage(url:
							Fetch.imageURL(weatherModel?.weather?.first?.icon ?? "10p"))
				.background(Color.orange.opacity(0.1))
			}
			VStack {
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
			}
		}
    }
}

//#Preview {
//	RoundedRectangleBGView()
//}
