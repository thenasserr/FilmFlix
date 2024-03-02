//
//  TabBarCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    func showHome()
    func showCart()
    func showNotifications()
    func showProfile()
}

protocol CartCoordinatorProtocol: Coordinator {
    func showCart()
}

final class TabBarCoordinator: TabBarCoordinatorProtocol, CartCoordinatorProtocol {
    
    let viewModel: FTabBarViewModelInterface = FTabBarViewModel.shared
    let router: Router
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        router.navigationController.navigationBar.isHidden = true
        viewModel.viewControllers = [
            homeViewController(),
            cartViewController(),
            notificationViewController(),
            profileViewController()
        ]
        let viewControler = FTabBarViewController(viewModel: viewModel)
        router.push(viewControler)
    }
    
    func showHome() {
        viewModel.selectedTab = .home
    }
    
    func showCart() {
        
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
    
    private func cartViewController() -> UIViewController {
        return UIViewController()
    }
    
    private func notificationViewController() -> UIViewController {
        return UIViewController()
    }
    
    private func profileViewController() -> UIViewController {
        return UIViewController()
    }
}
