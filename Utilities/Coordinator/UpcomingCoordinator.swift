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
    func showTabBar()
    func hideTabBar()
}

class UpcomingCoordinator: UpcomingCoordinatorProtocol {
    
    var router: Router
    var tabBarCoordinator: TabBarCoordinator
    
    init(router: Router, tabBarCoordinator: TabBarCoordinator) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showUpcoming()
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
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
