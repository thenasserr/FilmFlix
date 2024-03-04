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
        //swiftlint:disable all
        let baseURL = endpoint.baseURL
        let baseAppend = baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        let url = URL(string: baseAppend!)
        var urlRequest = URLRequest(url: url!)
        
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
    
    func fetchOther(query: String, endpoint: Endpoint) async throws -> VideoElement {
        //swiftlint:disable all
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { 
            throw URLError(.badURL)
        }
        
        print(query)
        let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?q=\(query)&key=AIzaSyDpPT0QVk_Ju9DFO6ow1LM6gqK6hycLAs8")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach {
            urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)
        }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
        
        guard let videoElement = results.items.first else {
            throw URLError(.badServerResponse)
        }
        
        return videoElement
    }
}
