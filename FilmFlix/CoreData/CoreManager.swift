//
//  Manager.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 04/03/2024.
//

import UIKit
import CoreData

// MARK: - Error Handling
enum DataBaseError: Error, LocalizedError {
    case failedToSaveData
    case failedToFetchData
    case failedToDeleteData
    case unknownError
}

// MARK: - CoreManager Protocol
protocol CoreManagerProtocol {
    func saveMovieToDatabase(movie: Movie) async throws
    func fetchMoviesFromDatabase() async throws -> [MovieModel]
    func deleteMoviesFromDatabase(movie: MovieModel) async throws
}

class CoreManager: CoreManagerProtocol {
    
    // MARK: Save Movie
    func saveMovieToDatabase(movie: Movie) async throws {
        guard let appDelegate = await UIApplication.shared.delegate as? AppDelegate else {
            throw DataBaseError.unknownError
        }
        
        let context = await appDelegate.persistentContainer.viewContext
        let movieItem = MovieModel(context: context)
        
        movieItem.original_title = movie.original_title
        movieItem.id = Int64(movie.id)
        movieItem.original_name = movie.original_name
        movieItem.overview = movie.overview
        movieItem.media_type = movie.media_type
        movieItem.poster_path = movie.poster_path
        movieItem.release_date = movie.release_date
        movieItem.vote_count = Int64(movie.vote_count)
        movieItem.vote_average = movie.vote_average
        
        do {
            try await context.save()
        } catch {
            throw DataBaseError.failedToSaveData
        }
    }
    
    // MARK: Fetch Movie
    func fetchMoviesFromDatabase() async throws -> [MovieModel] {
        guard let appDelegate = await UIApplication.shared.delegate as? AppDelegate else {
            throw DataBaseError.unknownError
        }
        
        let context = await appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<MovieModel> = MovieModel.fetchRequest()
        
        do {
            let titles = try await context.fetch(request)
            return titles
        } catch {
            throw DataBaseError.failedToFetchData
        }
    }
    
    // MARK: Delete Movie
    func deleteMoviesFromDatabase(movie: MovieModel) async throws {
        
        guard let appDelegate = await UIApplication.shared.delegate as? AppDelegate else {
            throw DataBaseError.unknownError
        }
        
        let context = await appDelegate.persistentContainer.viewContext
        context.delete(movie)
        
        do {
            try await context.save()
        } catch {
            throw DataBaseError.failedToDeleteData
        }
        
    }
}
