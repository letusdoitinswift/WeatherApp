//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import SwiftUI

struct WeatherView: View {
	@ObservedObject var wvm: WeatherViewModel
	@State var showXBtn: Bool = false
	var defaultHeader = "Weather"
	var errorHeader = "Sorry, something went wrong!"
	@Environment (\.unit) var unit
	@Environment (\.dismiss) var dismiss
	
	var body: some View {
		NavigationView {
			VStack {
				ScrollView {
					VStack {
						ZStack {
							VStack {
								ZStack {
									let model = wvm.weatherModel
									if model != nil {
										TempCardView(temp: Int(model?.main?.temp ?? 0.0),
													 icon: model?.weather?.first?.icon ?? "",
													 description: model?.weather?.first?.description ?? "",
													 high: Int(model?.main?.temp_max ?? 0.0),
													 low: Int(model?.main?.temp_min ?? 0.0),
													 name: model?.name ?? "Austin",
													 unit: _unit)
										HeaderView()
									} else if wvm.errorModel?.cod != nil {
										ErrorView()
									}
								}
								let model = wvm.weatherModel
								let lat = model?.coord?.lat ?? 0.0
								let lon = model?.coord?.lon ?? 0.0
								if wvm.errorModel?.cod == nil {
									HourlyView(hvm: HourlyViewModel(lat: lat, lon: lon))
								}
							}
						}
						
					}.navigationTitle(wvm.errorModel?.cod == nil ? defaultHeader : errorHeader)
						.navigationBarTitleDisplayMode(wvm.errorModel?.cod == nil ? .automatic : .inline)
						.toolbar(content: {
							if showXBtn {
								Button("Done") {
									dismiss()
								}
							}
						})
				}
				
			}.background(Color.blue.opacity(0.2))
				.environmentObject(wvm)
		}
		
	}
}

#Preview {
	WeatherView(wvm: WeatherViewModel())
}
