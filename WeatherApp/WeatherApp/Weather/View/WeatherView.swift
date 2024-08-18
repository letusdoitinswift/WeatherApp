//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var wvm: WeatherViewModel
    @State var showXBtn: Bool = false
    var defaultHeader = "Your Weather is here...!"
    var errorHeader = "Sorry, something went wrong!"
    @Environment (\.unit) var unit

    var body: some View {
        VStack {
            HStack {
                Text(wvm.errorModel?.cod == nil ? defaultHeader : errorHeader)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                Spacer()
                if showXBtn {
                    DoneButtonView()
                }
            }.padding()
            
            ScrollView {
                ZStack {
                    VStack {
                        ZStack {
                            let model = wvm.weatherModel
							if model != nil {
								TempCardView(temp: Int(model?.main?.temp ?? 0.0),
											 icon: model?.weather?.first?.icon ?? "",
											 description: model?.weather?.first?.description ?? "",
											 high: Int(model?.main?.temp_max ?? 0.0),
											 low: Int(model?.main?.temp_min ?? 0.0),
											 name: model?.name ?? "Austin",
											 unit: _unit)
								HeaderView()
							} else if wvm.errorModel?.cod != nil {
                                ErrorView()
                            }
                        }
                        
                        let model = wvm.weatherModel
                        let lat = model?.coord?.lat ?? 0.0
                        let lon = model?.coord?.lon ?? 0.0
                        if wvm.errorModel?.cod == nil {
                            HourlyView(hvm: HourlyViewModel(lat: lat, lon: lon))
                        }
                    }
                }
            }
        }
        .environmentObject(wvm)
        .padding(.top, 40)
    }
}

#Preview {
	WeatherView(wvm: WeatherViewModel())
}
