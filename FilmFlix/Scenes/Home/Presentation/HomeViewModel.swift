//
//  HomeViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

typealias HomeSectionsDelegate = TrendingMoviesSectionDelegate & TrendingTVsSectionDelegate

class HomeViewModel {
    
    // MARK: - Properties
    private let useCase: HomeUseCase
    private let coordinator: HomeCoordinatorProtocol
    
    // MARK: - Initialization
    init(useCase: HomeUseCase, coordinator: HomeCoordinatorProtocol) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionLayouts(delegate: self)
    }
}

// MARK: - HomeViewModel Sections Delegate Methods
extension HomeViewModel: HomeSectionsDelegate {
    func trendingTVsSection(_ section: TrendingTVsSection, didSelect item: Movie) {
        print(item)
    }
    
    func trendingMoviesSection(_ section: TrendingMoviesSection, didSelect item: Movie) {
        print(item)
    }
}