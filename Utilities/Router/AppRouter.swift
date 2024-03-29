//
//  AppRouter.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

public final class AppRouter: Router {
    public let navigationController: UINavigationController
    public let alertInterface: AlertInterface & UIViewController

    public required init(navigationController: UINavigationController, alertInterface: AlertInterface & UIViewController) {
        self.navigationController = navigationController
        self.alertInterface = alertInterface
        navigationController.navigationBar.titleTextAttributes = [.font: UIFont.h2, NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController.navigationBar.tintColor = .black

    }
    
    public func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentOverFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.view.backgroundColor = .clear
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
            completion()
        }
    }
    
    public func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: false)
        navigationController.pushViewController(viewController, animated: animated)
        completion()
    }
    
    public func reset(completion: @escaping () -> Void) {
        navigationController.dismiss(animated: false)
        navigationController.viewControllers.removeAll()
    }
    
    public func popToViewController(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        navigationController.popToViewController(viewController, animated: animated)
        completion()
    }
    
    public func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToRootViewController(animated: animated)
        completion()
    }
    
    public func showAlert(item: AlertItem, completion: @escaping () -> Void) {
        alertInterface.modalTransitionStyle = .coverVertical
        self.presentOverFullScreen(alertInterface, completion: completion)
        alertInterface.show(item: item)
    }
}
