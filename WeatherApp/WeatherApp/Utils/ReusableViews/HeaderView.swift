//
//  HeaderView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/12/24.
//

import SwiftUI

/// This shows the background image on the pages.
struct HeaderView: View {
    var image: String = "cloud.sun.fill"
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit).padding(.trailing, 10)
            }.padding([.trailing, .leading], 20)
            
            Text("\(DateTime.provideFinalDisplayDate())")
                .font(.callout)
                .fontWeight(.semibold)
        }
        .opacity(0.1)
        .padding()
    }
}

#Preview {
    HeaderView()
}
