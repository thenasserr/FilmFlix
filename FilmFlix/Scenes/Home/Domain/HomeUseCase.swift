//
//  HomeUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import Combine

protocol HomeUseCaseProtocol {
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout]
}

class HomeUseCase: HomeUseCaseProtocol {

    // MARK: - Properties
    private let trendingMoviesAPIService: MoviesAPI
    private let factory: HomeFactory
    
    // MARK: - Initialization
    init(trendingMoviesAPIService: MoviesAPI = MoviesAPIService(), factory: HomeFactory) {
        self.trendingMoviesAPIService = trendingMoviesAPIService
        self.factory = factory
    }
    
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout] {
        let trendingMovies = try await trendingMoviesAPIService.fetchMovies()
        var sections: [any SectionsLayout] = []
        
        if let trendingMovies = trendingMovies.results {
            let layout = factory.createSection(type: .trendingMovies(trendingMovies), delegate: delegate)
            sections.append(layout)
        }
        return sections
    }
}
