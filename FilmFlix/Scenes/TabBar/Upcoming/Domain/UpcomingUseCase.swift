//
//  UpcomingUseCase.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import Foundation

protocol UpcomingUseCaseProtocol {
    func getSectionsLayout(delegate: UpcomingSectionDelegate) async throws -> [any SectionsLayout]
}

class UpcomingUseCase: UpcomingUseCaseProtocol {
    // MARK: - Properties
    private let moviesAPIService: MoviesAPI
    private let factory: UpcomingFactory
    
    // MARK: - Initialization
    init(moviesAPIService: MoviesAPI = MoviesAPIService(), factory: UpcomingFactory) {
        self.moviesAPIService = moviesAPIService
        self.factory = factory
    }
    
    func getSectionsLayout(delegate: UpcomingSectionDelegate) async throws -> [any SectionsLayout] {
        let upcomingMovies = try await moviesAPIService.fetchUpcoming()
        var sections: [any SectionsLayout] = []
        
        if let upcomingMovies = upcomingMovies.results {
            let layout = factory.createSection(type: .upcoming(upcomingMovies), delegate: delegate, title: "")
            sections.append(layout)
        }
        return sections
    }
}
