//
//  NetworkConstants.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
enum APIUrls: String {
    
    case base = "http://api.weatherapi.com/v1/"
    case currentWeather = "current.json"
    case cityAutoComplete = "search.json"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum APIError: Error {
    case invalidResponse
    case invalidData
    case badUrl
}
