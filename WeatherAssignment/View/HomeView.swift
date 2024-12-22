//
//  HomeView.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 22/12/24.
//

import SwiftUI
import SwiftData
struct HomeView: View {
    @EnvironmentObject var viewModel:ViewModel
    @State var currentWeather:Weather
    @State var currentWeatherData:WeatherData
    @Environment(\.modelContext) private var modelContext
    @State var city:String
    @State var isSearching:Bool
    @Query private var weatherArray: [WeatherData]
    var body: some View {
        ZStack{
                VStack {
                    TextField("Enter city", text: $city, onCommit: {
                        Task{
                            let result = await viewModel.fetchWeather(for: city)
                            switch result {
                            case .success(let response):
                                       currentWeather =  response
                                       isSearching.toggle()
                                       let weatherData = WeatherData(name: city, temperature: response.current.tempC)
                                       modelContext.insert(weatherData)
                                       break
                            case .failure(let error):
                                print("Fetch failed: \(error.localizedDescription)")
                                break
                            }
                            try modelContext.save()

                        }
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    if isSearching{
                        Text("Weather in \(currentWeather.location.name)")
                            .font(.title)
                            .padding()
                        
                        Text("Temperature:\(currentWeather.current.tempC, specifier: "%.2f")°C")
                            .font(.headline)
                            .padding()
                    }else{
                        Text("Weather in \(currentWeatherData.name)")
                            .font(.title)
                            .padding()
                        
                        Text("Temperature:\(currentWeatherData.temperature, specifier: "%.2f")°C")
                            .font(.headline)
                            .padding()
                    }
                }
                .frame(maxWidth: .infinity,maxHeight:.infinity,alignment:.top)
                .padding()
                .onAppear {
                    if weatherArray.count > 0 {
                        currentWeatherData = weatherArray.last!
                    }
                }
            }
        }
}
