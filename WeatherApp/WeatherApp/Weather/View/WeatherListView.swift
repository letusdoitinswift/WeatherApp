//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.
//

import SwiftUI

struct WeatherListView: View {
	@ObservedObject var wvm: WeatherViewModel
    @State var searchText: String = ""
    @State var isPresented = false
    @State var wasTapped: Bool = false
    @StateObject var wlvm = WeatherListViewModel()
    var currentValue = 20

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        Button("Fetch Weather") {
                            Task {
								let (weatherModel, errorModel) = await Send<WeatherModel>().fetchWeather(using: searchText)
								wvm.weatherModel = weatherModel
								wvm.errorModel = errorModel
								if searchText != "" &&
									!(wvm.searchedStrings.contains(searchText) == true) {
									wvm.save(searched: searchText)
                                    if let model = weatherModel {
                                        wlvm.weatherModels?.append(model)
                                    }
                                }
                            }
                            isPresented = true
                        }
                        .font(.system(size: 20))
                        .padding()
                        .background(.orange)
                        .cornerRadius(10)
                        .foregroundColor(Color.accentColor)
                        .sheet(isPresented: $isPresented) {
							WeatherView(wvm: wvm, showXBtn: true)
                        }.padding()
                        
						let models = wlvm.weatherModels?.reversed() ?? []
                        ForEach(models,
                                id: \.self) { each in
                            VStack {
                                CityWeatherCardView(weatherModel: each)
                                    .onTapGesture {
                                        wasTapped.toggle()
                                        wvm.weatherModel = each
                                    }
                                    .sheet(isPresented: $wasTapped, content: {
                                        WeatherView(wvm: wvm, showXBtn: true)
                                    })
                            }
                        }
                    }.navigationTitle("Search Weather")
                }
                .searchable(text: $searchText, prompt: "Weather via city or a zip")
                ProgressView(value: wlvm.pageLoaded == true ? 100 : 20, total: 100).tint(wlvm.pageLoaded == true ? Color.green.opacity(0.5) : .blue.opacity(0.5))
					.progressViewStyle(.linear)
            }
        }
    }
}

#Preview {
	WeatherListView(wvm: WeatherViewModel())
}
