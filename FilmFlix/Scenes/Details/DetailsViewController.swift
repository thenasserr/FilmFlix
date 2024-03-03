//
//  DetailsViewController.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie
    
    // MARK: - IBOutlets
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var mainContainerView: UIStackView!
    @IBOutlet weak var detailsContainerView: UIStackView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releasedDate: UILabel!
    @IBOutlet weak var mediaType: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var detailsTitle: UILabel!
    
    // MARK: - Initialization
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        showDishDetails()
    }
    
    // MARK: - Private Methods
    private func showDishDetails() {
        let imageURL = (Constants.imageBase + movie.poster_path)
        posterImage.load(urlString: imageURL)
        detailsTitle.text = L10n.Details.title
        movieName.text = movie.original_name ?? movie.original_title
        mediaType.text = movie.media_type ?? "movie"
        releasedDate.text = movie.release_date
        popularityLabel.text = String(movie.vote_average)
        overviewLabel.text = movie.overview
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        posterImage.posterCustomShape()
        configureDetailsStackView()
        configureLabelsUI()
        configureMiddleView()
    }
    
    private func configureDetailsStackView() {
        detailsContainerView.layoutMargins = .init(top: 0, left: 10, bottom: 10, right: 10)
        detailsContainerView.isLayoutMarginsRelativeArrangement = true
        detailsContainerView.detailsCustomShape()
        detailsContainerView.backgroundColor = .white
    }
    
    private func configureMiddleView() {
        middleView.layer.cornerRadius = 15
        middleView.layer.borderWidth = 2
        middleView.layer.borderColor = UIColor.black.cgColor
        middleView.backgroundColor = .white
        
        reviewLabel.text = L10n.Details.Review.title
        reviewLabel.font = .h3
        reviewLabel.textColor = .black
    }
    
    private func configureLabelsUI() {
        detailsTitle.font = .h2
        detailsTitle.textColor = .black
        
        movieName.font = .h2
        movieName.textColor = .black
        
        mediaType.font = .regular
        mediaType.textColor = .gray
        
        releasedDate.font = .regular
        releasedDate.textColor = .gray
        
        popularityLabel.font = .regular
        popularityLabel.textColor = .gray
        
        overviewLabel.font = .regular
        overviewLabel.textColor = .gray
    }
}
