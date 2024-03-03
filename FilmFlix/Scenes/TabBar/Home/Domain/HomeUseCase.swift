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
            let layout = factory.createSection(type: .trendingMovies(trendingMovies), delegate: delegate, title: L10n.Home.Trending.movies)
            sections.append(layout)
        }
        
        let trendingTVs = try await trendingMoviesAPIService.fetchTVs()
        if let trendingTVs = trendingTVs.results {
            let layout = factory.createSection(type: .trendingTVs(trendingTVs), delegate: delegate, title: L10n.Home.Trending.tvs)
            sections.append(layout)
        }
        
        let populars = try await trendingMoviesAPIService.fetchPopulars()
        if let populars = populars.results {
            let layout = factory.createSection(type: .populars(populars), delegate: delegate, title: L10n.Home.Trending.populars)
            sections.append(layout)
        }
        
        let topRated = try await trendingMoviesAPIService.fetchTopRated()
        if let topRated = topRated.results {
            let layout = factory.createSection(type: .topRated(topRated), delegate: delegate, title: L10n.Home.Trending.topRated)
            sections.append(layout)
        }
        
        return sections
    }
}
