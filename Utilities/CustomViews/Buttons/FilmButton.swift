//
//  FilmButton.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import UIKit

class FilmButton: UIButton {
    var title: String? {
        get { titleLabel?.text }
        set { setTitle(newValue, for: .normal) }
    }
    
    var buttonBackgroundColor: UIColor? {
        get { backgroundColor }
        set { backgroundColor = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // MARK: - Setup Function For Creating Custom Button
    func setupButton() {
        let height: CGFloat = 52
        setTitleColor(.white, for: .normal)
        layer.cornerRadius   = height / 2
        heightAnchor.constraint(equalToConstant: height).isActive = true
        if #available(iOS 15.0, *) {
            configuration = nil
            titleLabel?.font = .medium
        }
    }
}
