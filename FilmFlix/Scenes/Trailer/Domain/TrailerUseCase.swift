//
//  TrailerUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import Foundation

protocol TrailerUseCaseProtocol {
    func getMovies(with title: String) async throws -> VideoElement
    func saveMovieToDatabase(movie: Movie) async throws
}

class TrailerUseCase: TrailerUseCaseProtocol {
    // MARK: - Properties
    private let trendingMoviesAPIService: MoviesAPI
    private let coreManager: CoreManager
    
    init(trendingMoviesAPIService: MoviesAPI = MoviesAPIService(), coreManager: CoreManager) {
        self.trendingMoviesAPIService = trendingMoviesAPIService
        self.coreManager = coreManager
    }
    
    func getMovies(with title: String) async throws -> VideoElement {
        try await trendingMoviesAPIService.getMovies(with: title)
    }
    
    func saveMovieToDatabase(movie: Movie) async throws {
        try await coreManager.saveMovieToDatabase(movie: movie)
    }
}
