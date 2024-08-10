//
//  ContentView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("\(DateTime.shared.date)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
