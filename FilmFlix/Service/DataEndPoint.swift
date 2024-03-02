//
//  EndPoint.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

enum DataEndpoint {
    case fetchMovies
    
    struct Constants {
        static let baseUrl = "https://api.themoviedb.org"
        static let APIKey = "/3/trending/movie/day?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    }
}

extension DataEndpoint: Endpoint {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
            case .fetchMovies:
                return Constants.APIKey
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
            case .fetchMovies:
                return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
            case .fetchMovies:
                return nil
        }
    }
}
