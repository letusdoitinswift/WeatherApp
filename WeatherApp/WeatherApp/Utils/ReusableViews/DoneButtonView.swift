//
//  DoneButtonView.swift
//  WeatherApp
//
//  Created by Manish Gupta on 8/15/24.
//

import SwiftUI

struct DoneButtonView: View {
    @Environment (\.dismiss) var dismiss
    var body: some View {
        Text("Done")
            .fontWeight(.bold)
            .font(.system(size: 10))
            .foregroundStyle(Color.accentColor)
            .padding([.leading, .trailing, .bottom, .top], 7)
            .background(.orange)
            .cornerRadius(4)
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    DoneButtonView()
}
