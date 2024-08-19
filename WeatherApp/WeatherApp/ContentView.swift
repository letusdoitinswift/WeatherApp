//
//  ContentView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @ObservedObject var wvm = WeatherViewModel()
	var body: some View {
		TabView {
			WeatherView(wvm: wvm)
				.tabItem {
					VStack {
						Text("Current Weather")
							.textCase(.uppercase)
						Image(systemName: "cloud.sun")
					}.padding([.bottom], 20)
				}.tag(0)
				.font(.headline)
			WeatherListView(wvm: wvm)
				.tabItem {
					VStack {
						Text("Search Weather")
							.textCase(.uppercase)
						Image(systemName: "magnifyingglass.circle.fill")
					}.padding([.bottom], 20)
				}.tag(1)
				.font(.headline)
		}
		.environmentObject(wvm)
	}
}

#Preview {
    ContentView()
}
