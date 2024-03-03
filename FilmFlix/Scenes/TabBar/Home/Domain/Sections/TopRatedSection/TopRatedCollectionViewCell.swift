//
//  TopRatedCollectionViewCell.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit

class TopRatedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup Method
    func setup(movie: Movie) {
        let imageURL = (Constants.imageBase + movie.poster_path)
        movieImage.load(urlString: imageURL)
        movieTitle.text = movie.original_title
        movieOverview.text = movie.overview
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        movieImage.layer.cornerRadius = 8
        configureContainerView()
        configureLabelsUI()
    }
    
    /// Configures the appearance of the container view, including shadows and corner radius.
    private func configureContainerView() {
        containerView.layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        containerView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        containerView.backgroundColor = .white
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 5
        containerView.layer.cornerRadius = 20
    }
    
    private func configureLabelsUI() {
        movieTitle.font = .medium
        movieTitle.textColor = .black
        movieOverview.font = .regular
        movieOverview.textColor = .gray
    }
}
