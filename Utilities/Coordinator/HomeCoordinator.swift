//
//  HomeCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func showHome()
    func showDetails(movie: Movie)
    func showTabBar()
    func hideTabBar()
}

class HomeCoordinator: HomeCoordinatorProtocol {
    
    var router: Router
    var tabBarCoordinator: TabBarCoordinator
    
    init(router: Router, tabBarCoordinator: TabBarCoordinator) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showHome()
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
    }
    
    func showHome() {
        let factory = HomeFactory()
        let useCase = HomeUseCase(factory: factory)
        let viewModel = HomeViewModel(useCase: useCase, coordinator: self)
        let vcc = HomeViewController(viewModel: viewModel)
        router.push(vcc)
    }
    
    func showDetails(movie: Movie) {
        let coordinator = DetailsCoordinator(router: router)
        coordinator.showDetails(movie: movie)
    }
}
