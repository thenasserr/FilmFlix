//
//  TabBarViewModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit
import Combine

protocol FTabBarViewModelInterface: AnyObject {  
    var tabBarIsHidden: Bool { get set }
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { get }
    
    var selectedTab: FTabBarType { get set }
    var selectedTabPublisher: Published<FTabBarType>.Publisher { get }
    
    var viewControllers: [UIViewController] { get set }
}

class FTabBarViewModel: ObservableObject, FTabBarViewModelInterface {
    static let shared = FTabBarViewModel()
        
    @Published var tabBarIsHidden: Bool = false
    var tabBarIsHiddenPublisher: Published<Bool>.Publisher { $tabBarIsHidden }
    
    @Published var selectedTab: FTabBarType = .home
    var selectedTabPublisher: Published<FTabBarType>.Publisher { $selectedTab }
    
    var viewControllers: [UIViewController] = []
}
