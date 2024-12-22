//
//  WeatherAssignmentApp.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 17/12/24.
//

import SwiftUI
import SwiftData
@main
struct WeatherAssignmentApp: App {
    var sharedModelContainer: ModelContainer = {
         let schema = Schema([
            WeatherData.self,
         ])
         let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

         do {
             return try ModelContainer(for: schema, configurations: [modelConfiguration])
         } catch {
             fatalError("Could not create ModelContainer: \(error)")
         }
     }()
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
            
        }.modelContainer(sharedModelContainer)

    }
}
