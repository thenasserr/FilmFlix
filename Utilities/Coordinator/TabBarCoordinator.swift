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
    func showDownload()
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
            downloadViewController()
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
    
    func showDownload() {
        viewModel.selectedTab = .download
    }
    
    private func homeViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(navigationController: navigationController, alertInterface: alertInterface)
        let coordinator = HomeCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    private func upcomingViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(navigationController: navigationController, alertInterface: alertInterface)
        let coordinator = UpcomingCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
    
    private func notificationViewController() -> UIViewController {
        return UIViewController()
    }
    
    private func downloadViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let alertInterface = AlertViewController()
        let router = AppRouter(navigationController: navigationController, alertInterface: alertInterface)
        let coordinator = DownloadsCoordinator(router: router, tabBarCoordinator: self)
        coordinator.start()
        return navigationController
    }
}
