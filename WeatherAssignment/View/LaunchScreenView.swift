//
//  LaunchScreenView.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 19/12/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            VStack {
                Text("Weather Assignment")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.center)
        }
    }
}

#Preview {
    LaunchScreenView()
}
