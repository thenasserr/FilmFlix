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
    func fetchPopulars() async throws -> TrendingTitleResponse
    func fetchTopRated() async throws -> TrendingTitleResponse
    func fetchUpcoming() async throws -> TrendingTitleResponse
    func fetchDiscoverMovies() async throws -> TrendingTitleResponse
    func search(with title: String) async throws -> [Movie]
    func getMovies(with title: String) async throws -> VideoElement
}

struct MoviesAPIService: MoviesAPI {
    func fetchMovies() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchMovies, type: TrendingTitleResponse.self)
    }
    
    func fetchTVs() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchTVs, type: TrendingTitleResponse.self)
    }
    
    func fetchPopulars() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchPopulars, type: TrendingTitleResponse.self)
    }
    
    func fetchTopRated() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchTopRated, type: TrendingTitleResponse.self)
    }
    
    func fetchUpcoming() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchUpcoming, type: TrendingTitleResponse.self)
    }
    
    func fetchDiscoverMovies() async throws -> TrendingTitleResponse {
        try await fetch(endpoint: DataEndpoint.fetchDiscoverMovies, type: TrendingTitleResponse.self)
    }
    
    func search(with title: String) async throws -> [Movie] {
        try await search(with: title, endpoint: DataEndpoint.search)
    }
    
    func getMovies(with title: String) async throws -> VideoElement {
        try await fetchOther(query: title, endpoint: DataEndpoint.getMovies)
    }
}
