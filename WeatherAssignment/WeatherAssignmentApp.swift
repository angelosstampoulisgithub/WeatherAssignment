//
//  WeatherAssignmentApp.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 17/12/24.
//

import SwiftUI

@main
struct WeatherAssignmentApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
