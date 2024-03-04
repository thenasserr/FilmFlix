//
//  PlayViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import Foundation

class TrailerViewModel {
    
    // MARK: - Properties
    let useCase: TrailerUseCase
    
    // MARK: - Initialization
    init(useCase: TrailerUseCase) {
        self.useCase = useCase
    }
    
    func getMovies(with title: String) async throws -> VideoElement {
        return try await useCase.getMovies(with: title)
    }
}
