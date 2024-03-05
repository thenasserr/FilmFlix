//
//  PlayViewController.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    // MARK: - Properties
    var movie: Movie
    var video: VideoElement?
    let viewModel: TrailerViewModel
    let buttonHeight: CGFloat = 52
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var watchLaterButton: FilmButton!
    @IBOutlet weak var downloadButton: FilmButton!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Initialization
    init(movie: Movie, viewModel: TrailerViewModel) {
        self.movie = movie
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchMovieData()
    }
    
    // MARK: - Private Methods
    private func fetchMovieData() {
        movieTitle.text = movie.original_name ?? movie.original_title
        overviewLabel.text = movie.overview
        fetchMovieTrailer()
    }
    
    private func fetchMovieTrailer() {
        Task {
            let movie = try await viewModel.getMovies(with: (movie.original_name ?? movie.original_title) ?? "")
            print(movie)
            configureWebView(model: TitlePreviewViewModel(youtubeView: movie))
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .fMainBackground
        containerView.backgroundColor = .fMainBackground
        webView.backgroundColor = .lightGray
        webView.layer.cornerRadius = 10
        configureDownLoadButtonUI()
        configureWatchLaterButtonUI()
        configureLabelsUI()
    }
    
    private func configureDownLoadButtonUI() {
        downloadButton.title = L10n.Play.Download.title
        downloadButton.buttonBackgroundColor = .fDownload
    }
    
    private func configureWatchLaterButtonUI() {
        watchLaterButton.title = L10n.Play.WatchLater.title
        watchLaterButton.buttonBackgroundColor = .fWatchLater
    }
    
    private func configureLabelsUI() {
        movieTitle.textColor = .black
        movieTitle.font = .h2
        
        overviewLabel.textColor = .lightGray
        overviewLabel.font = .medium
    }
    
    private func configureWebView(model: TitlePreviewViewModel) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - Buttons Action
    @IBAction func watchLaterButtonTapped(_ sender: Any) {
        print("Added To Watch Later..")
    }
    
    @IBAction func downloadButtonTapped(_ sender: Any) {
        Task {
            do {
                try await viewModel.saveMovieToDataBase(movie: movie)
                NotificationCenter.default.post(name: NSNotification.Name("downloaded"), object: nil)
            } catch {
                print("error")
            }
        }
    }
}
