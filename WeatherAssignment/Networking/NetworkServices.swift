//
//  NetworkServices.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
actor NetworkService {
    private let apiClient = APIClient()
    func currentWeather(_ key: String, _ city: String) async throws -> Weather? {
        let weatherResponse: Weather? = try await apiClient.APIRequest(APIEndpoints.currentWeather(q: city))
        return weatherResponse
    }
    func cityAutoComplete(_ query: String) async throws -> [City]? {
        let cityResponse: [City]? = try await apiClient.APIRequest(APIEndpoints.cityAutoComplete( q: query))
        return cityResponse
    }
}


