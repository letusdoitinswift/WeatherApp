//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.unit, UnitKey.defaultValue)
				.background(Color.blue.opacity(0.2))
        }
    }
}
