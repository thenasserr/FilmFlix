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
    
    init(useCase: SearchUseCase) {
        self.useCase = useCase
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionsLayout(delegate: self)
    }
}

extension SearchViewModel: SearchSectionDelegate {
    func searchSection(_ section: SearchSection, didSelect item: Movie) {
        print(item)
    }
}
