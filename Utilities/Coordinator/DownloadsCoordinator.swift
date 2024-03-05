//
//  DownloadsCoordinator.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import Foundation

protocol DownloadsCoordinatorProtocol: Coordinator {
    func showDownloads()
}

class DownloadsCoordinator: DownloadsCoordinatorProtocol {
    
    var router: Router
    var tabBarCoordinator: TabBarCoordinator
    
    init(router: Router, tabBarCoordinator: TabBarCoordinator) {
        self.router = router
        self.tabBarCoordinator = tabBarCoordinator
    }
    
    func start() {
        showDownloads()
    }
    
    func showDownloads() {
        let coreManager = CoreManager()
        let useCase = DownloadUseCase(coreManager: coreManager)
        let viewModel = DownloadViewModel(useCase: useCase, coordinator: self)
        let viewController = DownloadViewController(viewModel: viewModel)
        router.push(viewController)
    }
}
