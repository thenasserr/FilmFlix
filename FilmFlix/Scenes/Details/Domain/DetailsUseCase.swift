//
//  DetailsUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

protocol DetailsUseCaseProtocol {
    func saveMovieToDatabase(movie: Movie) async throws
}

class DetailsUseCase: DetailsUseCaseProtocol {
    // MARK: - Properties
    private let coreManager: CoreManager
    
    // MARK: - Initialization
    init(coreManager: CoreManager) {
        self.coreManager = coreManager
    }
    
    func saveMovieToDatabase(movie: Movie) async throws {
        try await coreManager.saveMovieToDatabase(movie: movie)
    }
}
