//
//  HomeFactory.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

import Foundation

enum SectionsTypes {
    case trendingMovies([Movie])
    case trendingTVs([Movie])
    case populars([Movie])
    case topRated([Movie])
}

class HomeFactory {
    func createSection(type: SectionsTypes, delegate: HomeSectionsDelegate, title: String) -> any SectionsLayout {
        switch type {
            
            case .trendingMovies(let trending):
                return TrendingMoviesSection(items: trending, delegate: delegate, sectionHeaderTitle: title)
            case .trendingTVs(let trending):
                return TrendingTVsSection(items: trending, delegate: delegate, sectionHeaderTitle: title)
            case .populars(let trending):
                return TrendingMoviesSection(items: trending, delegate: delegate, sectionHeaderTitle: title)
            case .topRated(let topRated):
                return TopRatedSection(items: topRated, delegate: delegate, sectionHeaderTitle: title)
        }
    }
    
}
