//
//  DetailsCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import Foundation

protocol DetailsCoordinatorProtocol: Coordinator {
    func showDetails(movie: Movie)
    func showTrailer(movie: Movie)
}

class DetailsCoordinator: DetailsCoordinatorProtocol {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        
    }
    
    func showDetails(movie: Movie) {
        let coreManage = CoreManager()
        let useCase = DetailsUseCase(coreManager: coreManage)
        let viewModel = DetailsViewModel(coordinator: self, useCase: useCase)
        let viewController = DetailsViewController(movie: movie, viewModel: viewModel)
        router.push(viewController)
    }
    
    func showTrailer(movie: Movie) {
        let coreManager = CoreManager()
        let useCase = TrailerUseCase(coreManager: coreManager)
        let viewModel = TrailerViewModel(useCase: useCase)
        let viewController = TrailerViewController(movie: movie, viewModel: viewModel)
        router.push(viewController)
    }
}
