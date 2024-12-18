//
//  APIEndpoints.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
protocol APIEndpoint {
    var baseURL: URL { get }
    var path: APIUrls { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

enum APIEndpoints: APIEndpoint {
    case currentWeather(q: String)
    case cityAutoComplete(q: String)

    var baseURL: URL {
        return URL(string: APIUrls.base.rawValue)!
    }
    
    var path: APIUrls {
        switch self {
        case .currentWeather(_):
            return .currentWeather
        case .cityAutoComplete(_):
            return .cityAutoComplete
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
            
        case .currentWeather(let q):
            return [
                "key": "1291b1b03e4d41fe81b71316241812",
                "q"  : q,
                "aqi": "no"
            ]
        case .cityAutoComplete(let q):
            return [
                "key": "1291b1b03e4d41fe81b71316241812",
                "q"  : q
            ]
        }
    }
}
