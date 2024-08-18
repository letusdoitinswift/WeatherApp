//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.
//

import SwiftUI

struct WeatherListView: View {
    @State var searchText: String = ""
    @State var isPresented = false
    @State var wasTapped: Bool = false
    @ObservedObject var wvm: WeatherViewModel
    @StateObject var wlvm = WeatherListViewModel()
    @State var weatherModels: [WeatherModel]? = []
    var currentValue = 20

    var strings: Set<String>? {
        Fetch.Defaults.fetcExistingWeatherDetails()
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        
                        Button("Fetch Weather") {
                            Task {
                                await wvm.fetchWeather(using: searchText)
                                if !(strings?.contains(searchText) == true) {
                                    if let model = wvm.weatherModel {
                                        self.weatherModels?.append(model)
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
                    }.navigationTitle("Search Weather)")
                        .task {
                            if weatherModels?.count == 0 {
                                weatherModels = wlvm.weatherModels ?? []
                            }
                        }
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
