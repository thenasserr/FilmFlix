//
//  DownloadViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

class DownloadViewModel {
    
    // MARK: - Properties
    private let useCase: DownloadUseCase
    private let coordinator: DownloadsCoordinatorProtocol
    
    // MARK: - Initialization
    init(useCase: DownloadUseCase, coordinator: DownloadsCoordinatorProtocol) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
   func fetchMoviesFromDataBase() async throws -> [MovieModel] {
       return try await useCase.fetchMoviesFromDataBase()
    }
    
    func deleteMoviesFromDatabase(movie: MovieModel) async throws {
        return try await useCase.deleteMoviesFromDatabase(movie: movie)
    }
}
