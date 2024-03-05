//
//  AlertViewController.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import UIKit

public protocol AlertInterface: AnyObject {
    func show(item: AlertItem)
}

class AlertViewController: UIViewController, AlertInterface {
    
    // MARK: - Properties
    var action: ActionHandler?

    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white.withAlphaComponent(0.3)
        setupAlertViewUI()
        setupConfirmButtonUI()
        setupLabelsUI()
    }
    
    private func setupAlertViewUI() {
        alertView.layer.cornerRadius = 20
        alertView.backgroundColor = .white
        alertView.layer.shadowColor = UIColor.gray.cgColor
        alertView.layer.shadowRadius = 10
        alertView.layer.shadowOpacity = 0.5
    }
    
    private func setupConfirmButtonUI() {
        confirmButton.heightConstraints(45)
        confirmButton.widthConstraints(120)
        confirmButton.layer.cornerRadius = 10
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .fWatchLater
    }
    
    private func setupLabelsUI() {
        titleLabel.textColor = .black
        titleLabel.font = .medium
        
        messageLabel.textColor = .black
        messageLabel.font = .regular
    }

    // MARK: - Button Action
    @IBAction func confirmButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        action?()
    }
    
    // MARK: - Setup Method
    func show(item: AlertItem) {
        titleLabel.text = L10n.Alert.title
        messageLabel.text = item.message
        confirmButton.setTitle(item.buttonTitle, for: .normal)
    }
}
