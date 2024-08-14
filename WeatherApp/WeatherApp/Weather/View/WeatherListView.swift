//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.
//

import SwiftUI

struct WeatherListView: View {
    @State var searchText: String = ""
    @State var isPresented = true
    @State var wvm: WeatherViewModel

    var body: some View {
        NavigationView {
            VStack {
                Button("Fetch Weather") {
                    wvm = WeatherViewModel(using: searchText)
                    isPresented = true
                }.buttonStyle(.borderedProminent)
                    .sheet(isPresented: $isPresented) {
                        WeatherView(wvm: wvm, showXBtn: true)
                    }
            }
            .navigationTitle("Search Weather")
        }
        .searchable(text: $searchText, prompt: "Weather via city or a zip")
    }
}
