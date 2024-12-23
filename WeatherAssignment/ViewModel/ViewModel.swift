//
//  ViewModel.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
import Combine
class ViewModel:ObservableObject {
    
    let networkService = APIClient()
    
    func fetchWeather(for city: String) async -> Result<Weather, Error>  {
        do {
            let response = try await networkService.request(method: .get, url: "http://api.weatherapi.com/v1/current.json?key=\(KeyConstants.weatherAPIKey.rawValue)&q=\(city)&aqi=no",of: Weather.self)
            return .success(response)
          } catch {
              return .failure(error)
          }
    }
 
}
