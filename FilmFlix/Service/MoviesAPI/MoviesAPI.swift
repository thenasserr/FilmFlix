//
//  MoviesAPI.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

protocol MoviesAPI: BaseAPI {
    func fetchMovies() async throws -> TrendingTitleResponse
    func fetchTVs() async throws -> TrendingTitleResponse
}

struct MoviesAPIService: MoviesAPI {
    func fetchMovies() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchMovies, type: TrendingTitleResponse.self)
    }
    
    func fetchTVs() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchTVs, type: TrendingTitleResponse.self)
    }
}
