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
    
    init(useCase: UpcomingUseCase) {
        self.useCase = useCase
    }
    
    func getSections() async throws -> [any SectionsLayout] {
        return try await useCase.getSectionsLayout(delegate: self)
    }
}

extension UpcomingViewModel: UpcomingSectionDelegate {
    func upcomingSection(_ section: UpcomingSection, didSelect item: Movie) {
        print(item)
    }
}
