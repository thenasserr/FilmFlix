//
//  DownloadTableViewCell.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import UIKit

class DownloadTableViewCell: UITableViewCell, Identifiable {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(movie: MovieModel) {
        let imageURL = (Constants.imageBase + (movie.poster_path ?? ""))
        movieImage.load(urlString: imageURL)
        movieTitle.text = movie.original_title
    }
    
    private func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
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
}
