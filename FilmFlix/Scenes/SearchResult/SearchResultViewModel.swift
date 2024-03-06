//
//  SearchResultViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 06/03/2024.
//

import Foundation

class SearchResultViewModel {
    let coordinator: UpcomingCoordinatorProtocol

    init(coordinator: UpcomingCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func showTrailer(movie: Movie) {
        coordinator.showTrailer(movie: movie)
    }
}
