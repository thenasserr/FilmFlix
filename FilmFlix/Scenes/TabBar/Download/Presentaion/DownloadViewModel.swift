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
    
    // MARK: - Initialization
    init(useCase: DownloadUseCase) {
        self.useCase = useCase
    }
    
   func fetchMoviesFromDataBase() async throws -> [MovieModel] {
       return try await useCase.fetchMoviesFromDataBase()
    }
    
    func deleteMoviesFromDatabase(movie: MovieModel) async throws {
        return try await useCase.deleteMoviesFromDatabase(movie: movie)
    }
}
