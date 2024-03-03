//
//  TabBarType.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit

enum FTabBarType: Int, CaseIterable, Hashable {
    case home = 0
    case upcoming
    case top
    case download
    
    private var title: String {
        switch self {
            case .home: "Home"
            case .upcoming: "Upcoming"
            case .top: "Top"
            case .download: "Download"
        }
    }
    
    private var icon: UIImage? {
        switch self {
            case .home: UIImage(systemName: "house")
            case .upcoming: UIImage(systemName: "play.circle")
            case .top: UIImage(systemName: "magnifyingglass.circle")
            case .download: UIImage(systemName: "arrowtriangle.down.circle")
        }
    }
    
    private var selectedIcon: UIImage? {
        switch self {
            case .home: UIImage(systemName: "house.fill")
            case .upcoming: UIImage(systemName: "play.circle.fill")
            case .top: UIImage(systemName: "magnifyingglass.circle.fill")
            case .download: UIImage(systemName: "arrowtriangle.down.circle.fill")
        }
    }
    
    var tabBarItem: UITabBarItem {
        let item = UITabBarItem(title: title, image: icon, selectedImage: selectedIcon)
        item.tag = self.rawValue
        return item
    }
}
