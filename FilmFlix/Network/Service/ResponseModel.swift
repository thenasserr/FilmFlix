//
//  ResponseModel.swift
//  FilmFlix
//
//  Created by Ibrahim Nasser Ibrahim on 02/03/2024.
//

struct TrendingTitleResponse: Codable {
    let results: [Movie]?
}
// swiftlint:disable all
struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
// swiftlint:enable all
