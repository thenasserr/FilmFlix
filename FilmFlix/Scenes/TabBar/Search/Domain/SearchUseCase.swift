//
//  SearchUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

protocol SearchUseCaseProtocol {
    func getSectionsLayout(delegate: SearchSectionDelegate) async throws -> [any SectionsLayout]
}

class SearchUseCase: SearchUseCaseProtocol {
    // MARK: - Properties
    private let moviesAPIService: MoviesAPI
    
    // MARK: - Initialization
    init(moviesAPIService: MoviesAPI = MoviesAPIService()) {
        self.moviesAPIService = moviesAPIService
    }
 
    func getSectionsLayout(delegate: SearchSectionDelegate) async throws -> [any SectionsLayout] {
        let discoverMovies = try await moviesAPIService.fetchDiscoverMovies()
        var sections: [any SectionsLayout] = []
        
        if let discoverMovies = discoverMovies.results {
            let layout = SearchSection(items: discoverMovies, delegate: delegate, sectionHeaderTitle: "")
            sections.append(layout)
        }
        return sections
    }
}
