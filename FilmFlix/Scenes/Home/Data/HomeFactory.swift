//
//  HomeFactory.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

enum SectionsTypes {
    case trendingMovies([Movie])
}

class HomeFactory {
    func createSection(type: SectionsTypes, delegate: HomeSectionsDelegate) -> any SectionsLayout {
        switch type {
            
            case .trendingMovies(let trending):
                return TrendingMoviesSection(items: trending, delegate: delegate)
        }
    }
    
}
