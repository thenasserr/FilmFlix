//
//  DetailsViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import Foundation

class DetailsViewModel {
    // MARK: - Properties
    private let coordinator: DetailsCoordinatorProtocol
    private let useCase: DetailsUseCase
    
    // MARK: - Initialization
    init(coordinator: DetailsCoordinatorProtocol, useCase: DetailsUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    func goToTrailer(movie: Movie) {
        coordinator.showTrailer(movie: movie)
    }
    
    func saveMovieToDataBase(movie: Movie) async throws {
        try await useCase.saveMovieToDatabase(movie: movie)
    }
}
