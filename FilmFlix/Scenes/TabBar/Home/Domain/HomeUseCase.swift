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
    private let moviesAPIService: MoviesAPI
    private let factory: HomeFactory
    
    // MARK: - Initialization
    init(moviesAPIService: MoviesAPI = MoviesAPIService(), factory: HomeFactory) {
        self.moviesAPIService = moviesAPIService
        self.factory = factory
    }
    
    func getSectionLayouts(delegate: HomeSectionsDelegate) async throws -> [any SectionsLayout] {
        let trendingMovies = try await moviesAPIService.fetchMovies()
        var sections: [any SectionsLayout] = []
        
        if let trendingMovies = trendingMovies.results {
            let layout = factory.createSection(type: .trendingMovies(trendingMovies), delegate: delegate, title: L10n.Home.Trending.movies)
            sections.append(layout)
        }
        
        let trendingTVs = try await moviesAPIService.fetchTVs()
        if let trendingTVs = trendingTVs.results {
            let layout = factory.createSection(type: .trendingTVs(trendingTVs), delegate: delegate, title: L10n.Home.Trending.tvs)
            sections.append(layout)
        }
        
        let populars = try await moviesAPIService.fetchPopulars()
        if let populars = populars.results {
            let layout = factory.createSection(type: .populars(populars), delegate: delegate, title: L10n.Home.Trending.populars)
            sections.append(layout)
        }
        
        let topRated = try await moviesAPIService.fetchTopRated()
        if let topRated = topRated.results {
            let layout = factory.createSection(type: .topRated(topRated), delegate: delegate, title: L10n.Home.Trending.topRated)
            sections.append(layout)
        }
        
        return sections
    }
}
