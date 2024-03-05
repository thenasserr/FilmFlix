//
//  SearchViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

class SearchViewModel {
    // MARK: - Properties
    let useCase: SearchUseCase
    private let coordinator: SearchCoordinatorProtocol

    init(useCase: SearchUseCase, coordinator: SearchCoordinatorProtocol) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionsLayout(delegate: self)
    }
    
    func search(with title: String) async throws -> [Movie] {
        return try await useCase.search(with: title)
    }
    
    func viewWillAppear() {
        coordinator.showTabBar()
    }
}

extension SearchViewModel: SearchSectionDelegate {
    func searchSection(_ section: SearchSection, didSelect item: Movie) {
        coordinator.showDetails(movie: item)
        coordinator.hideTabBar()
    }
}
