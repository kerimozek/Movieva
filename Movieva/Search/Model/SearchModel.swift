//
//  SearchModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

// MARK: - Popular
struct Search: Codable {
    let page: Int?
    let results: [SearchMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct SearchMovie: Codable, BaseModel {
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language, original_title, overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date, title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    }
