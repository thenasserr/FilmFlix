//
//  UpcomingViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import Foundation

class UpcomingViewModel {
    // MARK: - Properties
    let useCase: UpcomingUseCase
    private let coordinator: UpcomingCoordinatorProtocol

    // MARK: - Initialization
    init(useCase: UpcomingUseCase, coordinator: UpcomingCoordinatorProtocol) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionsLayout(delegate: self)
    }
    
    func viewWillAppear() {
        coordinator.showTabBar()
    }
}

extension UpcomingViewModel: UpcomingSectionDelegate {
    func upcomingSection(_ section: UpcomingSection, didSelect item: Movie) {
        coordinator.showTrailer(movie: item)
        coordinator.hideTabBar()
    }
}
