//
//  TabBarCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func showTabBar()
    func hideTabBar()
    func showHome()
    func showUpcoming()
    func showNotifications()
    func showProfile()
}

protocol UpcomingCoordinatorProtocol: Coordinator {
    func showUpcoming()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol, UpcomingCoordinatorProtocol {
    
    let viewModel: FTabBarViewModelInterface = FTabBarViewModel.shared
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        router.navigationController.navigationBar.isHidden = true
        viewModel.viewControllers = [
            homeViewController(),
            upcomingViewController(),
            notificationViewController(),
            profileViewController()
        ]
        let viewControler = FTabBarViewController(viewModel: viewModel)
        router.push(viewControler)
    }
    
    func showTabBar() {
        self.viewModel.tabBarIsHidden = false
    }
    
    func hideTabBar() {
        viewModel.tabBarIsHidden = true
    }
    
    func showHome() {
        viewModel.selectedTab = .home
    }
    
    func showUpcoming() {
        viewModel.selectedTab = .upcoming
    }
    
    func showNotifications() {
        
    }
    
    func showProfile() {
        
    }
    
    private func homeViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = HomeCoordinator(router: router)
        coordinator.start()
        return navigationController
    }
    
    private func upcomingViewController() -> UIViewController {
        let factory = UpcomingFactory()
        let useCase = UpcomingUseCase(factory: factory)
        let viewModel = UpcomingViewModel(useCase: useCase)
        let viewController = UpcomingViewController(viewModel: viewModel)
        return viewController
    }
    
    private func notificationViewController() -> UIViewController {
        return UIViewController()
    }
    
    private func profileViewController() -> UIViewController {
        return UIViewController()
    }
}
