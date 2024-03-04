//
//  DownloadUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

protocol DownloadUseCaseProtocol {
    func fetchMoviesFromDataBase() async throws -> [MovieModel]
    func deleteMoviesFromDatabase(movie: MovieModel) async throws
}

class DownloadUseCase: DownloadUseCaseProtocol {
    
    // MARK: - Properties
    private let coreManager: CoreManager
    
    // MARK: - Initialization
    init(coreManager: CoreManager) {
        self.coreManager = coreManager
    }
    
    func fetchMoviesFromDataBase() async throws -> [MovieModel] {
        return try await coreManager.fetchMoviesFromDatabase()
    }
    
    func deleteMoviesFromDatabase(movie: MovieModel) async throws {
        return try await coreManager.deleteMoviesFromDatabase(movie: movie)
    }
}
