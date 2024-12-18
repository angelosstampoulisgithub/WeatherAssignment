//
//  WeatherDetailsView.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var titleText: String
    var valueText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .foregroundStyle(Color.gray)
            Text(valueText)
                .font(.subheadline)
        }
        .padding()
    }
}
