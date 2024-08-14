//
//  ErrorView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/14/24.
//

import SwiftUI

/// Shows when a request fails
struct ErrorView: View {
    var image: String = "exclamationmark.triangle"
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit).padding(.trailing, 10)
            }.padding([.trailing, .leading], 20)
            Text("We are sorry, something went wrong. Please reenter the zip or city and try again!")
        }.opacity(0.1)
            .padding()
    }
}

#Preview {
    ErrorView()
}
