//
//  TrailerUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import Foundation

protocol TrailerUseCaseProtocol {
    func getMovies(with title: String) async throws -> VideoElement
}

class TrailerUseCase: TrailerUseCaseProtocol {
    // MARK: - Properties
    private let trendingMoviesAPIService: MoviesAPI
    
    init(trendingMoviesAPIService: MoviesAPI = MoviesAPIService()) {
        self.trendingMoviesAPIService = trendingMoviesAPIService
    }
    
    func getMovies(with title: String) async throws -> VideoElement {
        try await trendingMoviesAPIService.getMovies(with: title)
    }
}
