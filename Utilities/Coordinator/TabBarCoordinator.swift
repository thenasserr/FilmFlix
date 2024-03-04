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

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    
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
        let coordinator = HomeCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    private func upcomingViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let router = AppRouter(navigationController: navigationController)
        let coordinator = UpcomingCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    private func notificationViewController() -> UIViewController {
        return UIViewController()
    }
    
    private func profileViewController() -> UIViewController {
        return UIViewController()
    }
}
