//
//  APIClient.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Combine
import Foundation

enum Errors: Error {
    case invalidDecoding
}

protocol BaseAPI {
    func fetch<T>(endpoint: Endpoint, type: T.Type) async throws -> T where T: Decodable
}

extension BaseAPI {
    func fetch<T>(endpoint: Endpoint, type: T.Type) async throws -> T where T: Decodable {
        var urlRequest = URLRequest(url: endpoint.baseURL.appendingPathComponent(endpoint.path))
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {
            urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)
        }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw Errors.invalidDecoding
        }
        
        return decodedData
    }
}
