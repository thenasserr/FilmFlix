//
//  UpcomingFactory.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 03/03/2024.
//

import Foundation

enum UpcomingTypes {
    case upcoming([Movie])
}

class UpcomingFactory {
    func createSection(type: UpcomingTypes, delegate: UpcomingSectionDelegate, title: String) -> any SectionsLayout {
        switch type {
                
            case .upcoming(let upcoming):
                return UpcomingSection(items: upcoming, delegate: delegate, sectionHeaderTitle: title)
        }
    }
}
