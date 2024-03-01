//
//  TabBarType.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit

enum FTabBarType: Int, CaseIterable, Hashable {
    case home = 0
    case cart
    case notification
    case profile
    
    private var title: String {
        switch self {
            case .home: "Home"
            case .cart: "Coming Soon"
            case .notification: "Top"
            case .profile: "Download"
        }
    }
    
    private var icon: UIImage? {
        switch self {
            case .home: UIImage(systemName: "house")
            case .cart: UIImage(systemName: "play.circle")
            case .notification: UIImage(systemName: "magnifyingglass.circle")
            case .profile: UIImage(systemName: "arrowtriangle.down.circle")
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
            case .home: UIImage(systemName: "house.fill")
            case .cart: UIImage(systemName: "play.circle.fill")
            case .notification: UIImage(systemName: "magnifyingglass.circle.fill")
            case .profile: UIImage(systemName: "arrowtriangle.down.circle.fill")
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
