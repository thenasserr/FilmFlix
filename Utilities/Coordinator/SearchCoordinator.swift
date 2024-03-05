//
//  SearchCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

protocol SearchCoordinatorProtocol: Coordinator {
    func showSearch()
    func showDetails(movie: Movie)
    func showTabBar()
    func hideTabBar()
}

class SearchCoordinator: SearchCoordinatorProtocol {
    var router: Router
    var tabBarCoordinator: TabBarCoordinator
    
    init(router: Router, tabBarCoordinator: TabBarCoordinator) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showSearch()
    }
    
    func showTabBar() {
        tabBarCoordinator.showTabBar()
    }
    
    func hideTabBar() {
        tabBarCoordinator.hideTabBar()
    }
    
    func showSearch() {
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(useCase: useCase, coordinator: self)
        let viewController = SearchViewController(viewModel: viewModel)
        router.push(viewController)
    }
    
    func showDetails(movie: Movie) {
        let coordinator = DetailsCoordinator(router: router)
        coordinator.showDetails(movie: movie)
    }
}
