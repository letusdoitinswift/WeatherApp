//
//  LaunchImageView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/19/24.
//

import SwiftUI

struct LaunchImageView: View {
    var body: some View {
		ZStack {
			Color.blue.opacity(0.3)
			VStack {
				Image(systemName: "cloud.sun.fill")
					.font(.system(size: 150))
					.aspectRatio(contentMode: .fit)

			}.foregroundColor(.blue)
				
		}.ignoresSafeArea()
    }
}

#Preview {
    LaunchImageView()
}
