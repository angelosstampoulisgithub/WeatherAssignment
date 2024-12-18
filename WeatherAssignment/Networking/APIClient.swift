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
    func APIRequest<T: Decodable>(_ endpoint: APIEndpoints) async throws -> T? {
        return await withCheckedContinuation { continuation in
            var urlComponents = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path.rawValue), resolvingAgainstBaseURL: false)!
            
            var request = URLRequest(url: urlComponents.url!)
            request.httpMethod = endpoint.method.rawValue
            
            if endpoint.method == .get, let parameters = endpoint.parameters {
                urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                request.url = urlComponents.url
            } else if endpoint.method == .post, let parameters = endpoint.parameters {
                
                let formBodyString = parameters.map { "\($0)=\($1)" }.joined(separator: "&")
                let postData = formBodyString.data(using: .utf8)
                request.httpBody = postData
            }
            AF.request(request).responseDecodable(of: T.self) { response in
                do{
                    guard let httpResponse = response.response, (200...299).contains(httpResponse.statusCode) else {
                        throw APIError.invalidResponse
                    }
                }catch{
                    print("something went wrong!!!")
                    
                }
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: response.data!)
                    continuation.resume(returning: decodedResponse)
                } catch let DecodingError.dataCorrupted(context) {
                    print("Data corrupted: \(context.debugDescription)")
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("CodingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("CodingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("CodingPath:", context.codingPath)
                } catch {
                    print("Unknown error: \(error)")
                }
            }
        }
    }
}
