//
//  Searching.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import SwiftUI

struct Searching: View {
    @EnvironmentObject var viewModel:ViewModel
    var body: some View {
        ZStack{
        if !viewModel.isSearching {
            VStack {
                AsyncImage(url: URL(string: viewModel.currentWeather?.current.condition.icon ?? "")) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                } placeholder: {
                    
                }
                .padding(.top, 20)

                Text(viewModel.currentWeather?.location.name ?? "")
                    .font(.system(size: 42, weight: .bold))
                    .padding(.top, 10)

                Text(String(format: "%.0f\u{00B0}", viewModel.currentWeather?.current.tempC ?? 0))
                    .font(.system(size: 70, weight: .medium))
                    .padding(.top, 5)

                HStack {
                    WeatherDetailView(titleText: "Humidity", valueText: String(format: "%.1f", viewModel.currentWeather?.current.humidity ?? 0))
                    WeatherDetailView(titleText: "UV Index", valueText: String(format: "%.0f", viewModel.currentWeather?.current.uv ?? 0))
                    WeatherDetailView(titleText: "Feels Like", valueText: String(format: "%.0f\u{00B0}", viewModel.currentWeather?.current.feelslikeC ?? 0))
                }
                .background(Color.gray)
                .cornerRadius(20)
            }
        }
        if viewModel.isSearching{
                ScrollView {
                    ForEach(viewModel.searchResults.indices, id: \.self) { index in
                        
                        let city = viewModel.searchResults[index]
                        let weather = viewModel.searchResultsWeather[city.name]
                        
                        VStack {
                            HStack {
                                VStack(alignment: .leading, content: {
                                    
                                    Text("\(city.name), \(city.country)")
                                        .font(.system(size: 24, weight: .bold))
                                    Text(String(format: "%.0f\u{00B0}", weather?.current.tempC ?? 0))
                                        .font(.system(size: 24, weight: .medium))
                                })
                                .padding(.leading, 20)
                                Spacer()
                                
                                AsyncImage(url: URL(string: weather?.current.condition.icon ?? "")) { image in
                                    image.resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(10)
                        }
                        .padding(.top, 20)
                        .onTapGesture {
                            viewModel.isSearching = false
                            viewModel.searchQuery = ""
                            viewModel.currentWeather = weather
                            CityDefaultsHelper.saveCity(city.name)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Searching(viewModel: .init())
}
