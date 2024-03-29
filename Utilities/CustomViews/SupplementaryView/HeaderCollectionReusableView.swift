//
//  HeaderCollectionReusableView.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 17/02/2024.
//

import UIKit

extension UICollectionReusableView: Identifiable {}

class HeaderCollectionReusableView: UICollectionReusableView {
    // MARK: - Static Properties
    static let elementKind = String("header")

    // MARK: - IBOutlets
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Setup
    ///
    /// Common initialization method.
    private func commonInit() {
        loadNib()
        setupUI()
    }
    
    // MARK: - Setup the Default UI
    private func setupUI() {
        titleLabel.textColor = .black
        titleLabel.font = .h2
        
        if #available(iOS 15.0, *) {
            button.configuration = nil
            button.setTitleColor(.gray, for: .normal)
        }
    }
    
    // MARK: - Public Methods
        
    /// Sets up the title for the header view.
    ///
    /// - Parameter title: The title to be displayed.
    func setupHeaderTitle(title: String) {
        titleLabel.text = title
    }
    
    /// Sets up the title for the header button.
    ///
    /// - Parameter buttonTitle: The title to be displayed on the button.
    func setupHeaderButtonTitle(buttonTitle: String) {
        button.setTitle(buttonTitle, for: .normal)
    }
}

private extension HeaderCollectionReusableView {
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
            let view = loadedViews.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        // swiftlint:enable all
    }
}
