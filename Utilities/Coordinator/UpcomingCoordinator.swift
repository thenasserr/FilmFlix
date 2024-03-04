//
//  UpcomingCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import Foundation

protocol UpcomingCoordinatorProtocol: Coordinator {
    func showUpcoming()
    func showTrailer(movie: Movie)
}

class UpcomingCoordinator: UpcomingCoordinatorProtocol {
    
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        showUpcoming()
    }
    
    func showUpcoming() {
        let factory = UpcomingFactory()
        let useCase = UpcomingUseCase(factory: factory)
        let viewModel = UpcomingViewModel(useCase: useCase, coordinator: self)
        let viewController = UpcomingViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showTrailer(movie: Movie) {
        let useCase = TrailerUseCase()
        let viewModel = TrailerViewModel(useCase: useCase)
        let viewController = TrailerViewController(movie: movie, viewModel: viewModel)
        router.push(viewController)
    }
}
