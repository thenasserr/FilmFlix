//
//  TabBarViewControlle.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit
import MakeConstraints
import Combine

class FTabBarViewController: UITabBarController {
    let emTabBar = FilmFlix.FTabBar()
    
    var cancellable = Set<AnyCancellable>()
    var tabBarConstraints: AnchoredConstraints?
    
    let viewModel: FTabBarViewModelInterface
    init(viewModel: FTabBarViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isHidden = true
        viewControllers = viewModel.viewControllers
        setupEMTapBar()
        
        viewModel.selectedTabPublisher.sink { [weak self] type in
            self?.selectedIndex = type.rawValue
            self?.emTabBar.selectItem(at: type.rawValue)
        }
        .store(in: &cancellable)
        
        viewModel.tabBarIsHiddenPublisher
            .sink { [self] hidden in
                self.tabBarConstraints?.bottom?.constant = hidden ? 100 : 0
                
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    
                    if !hidden {
                        self.emTabBar.isHidden = hidden
                    }
                } completion: { _ in
                    self.emTabBar.isHidden = hidden
                }
                
            }
            .store(in: &cancellable)
    }
    
    private func setupEMTapBar() {
        emTabBar.delegate = self
        view.addSubview(emTabBar)
        emTabBar.fillXSuperView()
        tabBarConstraints = emTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        emTabBar.setItems(FTabBarType.allCases.map { $0.tabBarItem })
    }
}

extension FTabBarViewController: FTamBarDelegate {
    func FTabBar(_ emTabBar: FTabBar, didSelect emItem: FTabBarItem) {
        selectedIndex = emItem.tag
        viewModel.selectedTab = FTabBarType(rawValue: emItem.tag) ?? .home
    }
}
