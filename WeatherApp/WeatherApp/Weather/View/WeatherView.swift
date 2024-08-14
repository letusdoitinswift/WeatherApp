//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/9/24.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var wvm: WeatherViewModel
    @State var showXBtn: Bool = false
    @Environment (\.unit) var unit
    @Environment (\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Text("Your Weather is here...!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                Spacer()
                if showXBtn {
                    Button("X") {
                        dismiss()
                    }
                }
            }.padding()
            
            ScrollView {
                ZStack {
                    VStack {
                        ZStack {
                            let model = wvm.weatherModel
                            TempCardView(temp: Int(model?.main?.temp ?? 0.0),
                                         icon: model?.weather?.first?.icon ?? "",
                                         description: model?.weather?.first?.description ?? "",
                                         high: Int(model?.main?.temp_max ?? 0.0),
                                         low: Int(model?.main?.temp_min ?? 0.0),
                                         name: model?.name ?? "Austin",
                                         unit: _unit).opacity(wvm.errorModel?.cod == nil ? 1.0 : 0.1)
                            
                            if wvm.errorModel?.cod != nil {
                                ErrorView()
                            } else {
                                HeaderView().opacity(0.1)
                            }
                        }
                        let model = wvm.weatherModel
                        let lat = model?.coord?.lat ?? 0.0
                        let lon = model?.coord?.lon ?? 0.0
                        if wvm.errorModel?.cod == nil {
                            HourlyView(dvm: HourlyViewModel(lat: lat, lon: lon))
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
