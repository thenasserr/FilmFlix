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
    let fTabBar = FilmFlix.FTabBar()
    
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
        setupFTapBar()
        
        viewModel.selectedTabPublisher.sink { [weak self] type in
            self?.selectedIndex = type.rawValue
            self?.fTabBar.selectItem(at: type.rawValue)
        }
        .store(in: &cancellable)
        
        viewModel.tabBarIsHiddenPublisher
                    .sink { [self] hidden in
                        self.tabBarConstraints?.bottom?.constant = hidden ? 100 : 0

                        UIView.animate(withDuration: 0.5) {
                            self.view.layoutIfNeeded()

                            if !hidden {
                                self.fTabBar.isHidden = hidden
                            }
                        } completion: { _ in
                            self.fTabBar.isHidden = hidden
                        }

                    }
                    .store(in: &cancellable)
    }
    
    private func setupFTapBar() {
        fTabBar.delegate = self
        view.addSubview(fTabBar)
        fTabBar.fillXSuperView()
        tabBarConstraints = fTabBar.makeConstraints(bottomAnchor: view.bottomAnchor)
        fTabBar.setItems(FTabBarType.allCases.map { $0.tabBarItem })
    }
}

extension FTabBarViewController: FTamBarDelegate {
    func FTabBar(_ emTabBar: FTabBar, didSelect emItem: FTabBarItem) {
        selectedIndex = emItem.tag
        viewModel.selectedTab = FTabBarType(rawValue: emItem.tag) ?? .home
    }
}
