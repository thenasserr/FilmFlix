//
//  UpcomingCollectionViewCell.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

    func setup(movie: Movie) {
        let imageURL = (Constants.imageBase + movie.poster_path)
        movieImage.load(urlString: imageURL)
        movieTitle.text = movie.original_title
    }
    
    private func configureUI() {
        movieImage.layer.cornerRadius = 8
        configureLabelUI()
        configurePlayButtonUI()
    }
    
    private func configurePlayButtonUI() {
        if #available(iOS 15.0, *) {
            playButton.configuration = nil
            playButton.setTitle("", for: .normal)
            playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            playButton.tintColor = .black
        }
    }
    
    private func configureLabelUI() {
        movieTitle.font = .medium
        movieTitle.textColor = .black
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        print("Playing....")
    }
}
