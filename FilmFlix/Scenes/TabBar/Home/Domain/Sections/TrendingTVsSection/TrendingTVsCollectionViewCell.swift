//
//  TrendingTVsCollectionViewCell.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import UIKit

class TrendingTVsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var tvOverview: UILabel!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvImage: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup Method
    func setup(movie: Movie) {
        let imageURL = (Constants.imageBase + movie.poster_path)
        tvImage.load(urlString: imageURL)
        tvTitle.text = movie.original_name
        tvOverview.text = movie.overview
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        tvImage.layer.cornerRadius = 8
        configureContainerView()
        configureLabelsUI()
    }
    
    /// Configures the appearance of the container view, including shadows and corner radius.
    private func configureContainerView() {
        containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        containerView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 6
        containerView.layer.cornerRadius = 20
    }
    
    private func configureLabelsUI() {
        tvTitle.font = .medium
        tvTitle.textColor = .black
        tvOverview.font = .regular
        tvOverview.textColor = .gray
    }
}
