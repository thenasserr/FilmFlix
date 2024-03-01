//
//  TabBar.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 01/03/2024.
//

import UIKit
import MakeConstraints

protocol FTamBarDelegate: AnyObject {
    // called when a new view is selected by the user (but not programmatically)
    func FTabBar(_ emTabBar: FTabBar, didSelect emItem: FTabBarItem)
}

class FTabBar: UIView {
    // MARK: - subviews
    //
    private let stackView: UIStackView = UIStackView()
    private var tapGestures: [UITapGestureRecognizer] = []
    // MARK: - properties
    //
    private(set) var emItems: [FTabBarItem] = []
    weak private(set) var selectedItem: FTabBarItem?
    
    weak var delegate: FTamBarDelegate?
    
    // MARK: - Initializer
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func selectItem(at index: Int) {
        let item = emItems[index]
        self.select(item)
    }
    
    // MARK: - setup subviews
    //
    private func setup() {
        backgroundColor = .black
        heightConstraints(46 + (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 20))
        layer.cornerRadius = 12
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        
        let bottomPadding = (UIApplication.shared.mainWindow?.safeAreaInsets.bottom ?? 0) / 2
        let padding = UIEdgeInsets(top: 0, left: 32, bottom: bottomPadding, right: 32)
        stackView.fillSuperview(padding: padding)
    }
    
    public func setItems(_ items: [UITabBarItem]) {
        for item in items {
            let tabBarItem = FTabBarItem(item: item)
            stackView.addArrangedSubview(tabBarItem)
            emItems.append(tabBarItem)
        }
        select(emItems.first)
        addTapGestures()
    }
    
    private func addTapGestures() {
        stackView.arrangedSubviews.forEach { view in
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
            view.addGestureRecognizer(tapGesture)
        }
    }

    @objc private func tapped(_ sender: UITapGestureRecognizer) {
        guard let emItem = sender.view as? FTabBarItem else {
            return
        }
        select(emItem)
        delegate?.FTabBar(self, didSelect: emItem)
    }
    
    private func select(_ item: FTabBarItem?) {
        selectedItem = item
        for emItem in emItems {
            if item === emItem {
                emItem.select()
            } else {
                emItem.unSelect()
            }
        }
    }
}
