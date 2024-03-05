//
//  AppCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func makeWindow(from windowScene: UIWindowScene)
    func showTabBar()
    func showAlert(item: AlertItem)
}

class AppCoordinator: AppCoordinatorProtocol {
    
    var window: UIWindow?
    var isLogin = true
    
    static let shared = AppCoordinator()
    
    var router: Router
    init() {
        router = AppRouter(navigationController: .init(), alertInterface: AlertViewController())
    }
    
    func start() {
        showTabBar()
    }
    
    func makeWindow(from windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func showTabBar() {
        let coordinator = TabBarCoordinator(router: self.router)
        router.reset()
        coordinator.start()
    }
    
    func showAlert(item: AlertItem) {
        self.router.showAlert(item: item)
    }
}
