//
//  Constants.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

struct Constants {
    static let baseUrl = "https://api.themoviedb.org"
    static let moviesPath = "/3/trending/movie/day?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    static let tvsPath = "/3/trending/tv/day?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    static let populars = "/3/movie/popular?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    static let topRated = "/3/movie/top_rated?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    static let upcoming = "/3/movie/upcoming?api_key=ad34c2ce43a8071dfe7bb834f3b99937"
    static let discover = "/3/discover/movie?api_key=ad34c2ce43a8071dfe7bb834f3b99937&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
    static let youtube = "https://youtube.googleapis.com/youtube/v3/search?"
    static let imageBase = "https://image.tmdb.org/t/p/w500"
    static let youTube = "https://www.youtube.com/embed/"
}
