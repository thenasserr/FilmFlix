//
//  HomeViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

typealias HomeSectionsDelegate = TrendingMoviesSectionDelegate

class HomeViewModel {
    
    // MARK: - Properties
    private let useCase: HomeUseCase
    
    // MARK: - Initialization
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionLayouts(delegate: self)
    }
}

// MARK: - HomeViewModel Sections Delegate Methods
extension HomeViewModel: HomeSectionsDelegate {
    func trendingMoviesSection(_ section: TrendingMoviesSection, didSelect item: Movie) {
        print(item)
    }
}
