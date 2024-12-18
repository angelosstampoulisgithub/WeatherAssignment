//
//  ViewModel.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var currentWeather: Weather?
    @Published var searchQuery: String = ""
    @Published var isSearching: Bool = false

    @Published var searchResults: [City] = []
    @Published var searchResultsWeather: [String: Weather] = [:]


    let networkService = NetworkService()
    
    func fetchWeather(for city: String) async {
        if let result = try? await networkService.currentWeather(KeyConstants.weatherAPIKey.rawValue, city)
        {
            await MainActor.run {
                
                if isSearching
                {
                    searchResultsWeather[city] = result
                }
                else
                {
                    currentWeather = result
                }
            }
        }
    }
    
    func fetchCity() async {
        
        if let results = try? await networkService.cityAutoComplete(searchQuery) {
            await MainActor.run {
                searchResults = results
            }
            
            for city in results {
                await fetchWeather(for: city.name)
            }
        }
    }
    
    func loadCurrentWeather() async
    {
        if let city = CityDefaultsHelper.getCity() {
            
            if currentWeather?.location.name != city
            {
                await fetchWeather(for: city)
            }
        }
    }
}
