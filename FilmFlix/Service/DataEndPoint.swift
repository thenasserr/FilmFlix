//
//  EndPoint.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

enum DataEndpoint {
    case fetchMovies
    case fetchTVs
    case fetchPopulars
    case fetchTopRated
    
    struct Constants {
        static let baseUrl = "https://api.themoviedb.org"
        static let moviesPath = "/3/trending/movie/day?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
        static let tvsPath = "/3/trending/tv/day?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
        static let populars = "/3/movie/popular?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
        static let topRated = "/3/movie/top_rated?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
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
                return Constants.moviesPath
            case .fetchTVs:
                return Constants.tvsPath
            case .fetchPopulars:
                return Constants.populars
            case .fetchTopRated:
                return Constants.topRated
        }
    }
    
    var method: HTTPRequestMethod {
        switch self {
            case .fetchMovies:
                return .get
            case .fetchTVs:
                return .get
            case .fetchPopulars:
                return .get
            case .fetchTopRated:
                return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
            case .fetchMovies:
                return nil
            case .fetchTVs:
                return nil
            case .fetchPopulars:
                return nil
            case .fetchTopRated:
                return nil
        }
    }
}
