//
//  APIClient.swift
//  WeatherAssignment
//
//  Created by Angelos Staboulis on 18/12/24.
//

import Foundation
import Combine
import Alamofire
actor APIClient {
    func request<T: Decodable>(
        method: HTTPMethod,
        url: String,
        of type: T.Type
    ) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method
            ).responseDecodable(of: type) { response in
                switch response.result {
                case let .success(data):
                    continuation.resume(returning: data)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
