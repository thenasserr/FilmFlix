//
//  TableViewController.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 05/03/2024.
//

import UIKit

class DownloadViewController: UITableViewController {
    
    // MARK: - Properties
    var movies: [MovieModel] = []
    let viewModel: DownloadViewModel
    
    // MARK: - Initialization
    init(viewModel: DownloadViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMoviesFromDataBase()
        observeSavedMovies()
        configureTableView()
        self.title = "Downloads"
    }
    
    // MARK: - Private Methods
    private func observeSavedMovies() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("downloaded"), object: nil, queue: nil) { _ in
            self.fetchMoviesFromDataBase()
        }
    }
    
    private func fetchMoviesFromDataBase() {
        Task {
            do {
                let movies = try await viewModel.fetchMoviesFromDataBase()
                self.movies = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("error")
            }
        }
    }
    
    private func configureTableView() {
        tableView.registerNib(DownloadTableViewCell.self)
        view.backgroundColor = .fMainBackground
        tableView.backgroundColor = .fMainBackground
        tableView.separatorStyle = .none
    }
    
    private func deleteMovieAndRow(_ movie: MovieModel, at indexPath: IndexPath) async throws {
        try await viewModel.deleteMoviesFromDatabase(movie: movie)
        movies.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: DownloadTableViewCell = tableView.dequeue(indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.setup(movie: movies[indexPath.row])
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        let deletedMovie = movies[indexPath.row]
        
        Task {
            do {
                try await deleteMovieAndRow(deletedMovie, at: indexPath)
            } catch {
                print("Error deleting movie:", error.localizedDescription)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
