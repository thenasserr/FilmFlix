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
    
    init(coordinator: DetailsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func goToTrailer(movie: Movie) {
        coordinator.showTrailer(movie: movie)
    }
}
