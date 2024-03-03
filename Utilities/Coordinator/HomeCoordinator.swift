//
//  HomeCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showDetails(movie: Movie)
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showHome()
    }
    
    func showHome() {
        let factory = HomeFactory()
        let useCase = HomeUseCase(factory: factory)
        let viewModel = HomeViewModel(useCase: useCase, coordinator: self)
        let vcc = HomeViewController(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showDetails(movie: Movie) {
        let viewController = DetailsViewController(movie: movie)
        router.push(viewController)
    }
}
