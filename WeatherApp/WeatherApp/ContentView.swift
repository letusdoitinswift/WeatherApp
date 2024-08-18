//
//  ContentView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var wvm: WeatherViewModel
    var body: some View {
        TabView {
            ScrollView {
                VStack {
                    WeatherView(wvm: WeatherViewModel())
                }
            }.tabItem { Text("Current Weather") }
                .tag(0)
            WeatherListView(wvm: WeatherViewModel())
                .tabItem {
                Text("Check Weather")
            }.tag(1)
        }
    }
}

#Preview {
    ContentView()
}
