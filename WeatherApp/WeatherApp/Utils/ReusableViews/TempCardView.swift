//
//  TempCardView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.
//

import SwiftUI

/// A reusable view to show the City Name and Temperature
struct TempCardView: View {
    var temp: Int = 77
    var icon: String = "10p"
    var description: String = "Weather Conditions unknown at this moment"
    var high: Int = 78
    var low: Int = 59
    var name: String = "Cupertino"
    @Environment (\.unit) var unit
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 0)
                .fill(Color.blue)
                .frame(width: 200, height: 250)
                .cornerRadius(20)
                .background {
                    VStack(alignment: .center) {
                        Text(name)
                            .font(.title)
                        HStack {
                            Text("\(temp)\(unit.rawValue)")
                                .font(.system(size: 40))
                            let image = icon
                            AsyncImage(url: Fetch.imageURL(image))
                                .frame(width: 40, height: 40)
								.background(Color.blue)
                        }
                        Text(description)
                        Text("H:\(high)\(unit.rawValue) L:\(low)\(unit.rawValue)")
                        
                    }.padding()
                }
        }
        .padding()
    }
}

#Preview {
    TempCardView()
}
