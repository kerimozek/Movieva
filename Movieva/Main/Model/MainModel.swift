//
//  MainModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//   let topRated = try? newJSONDecoder().decode(TopRated.self, from: jsonData)

import Foundation

// MARK: - TopRated
struct TopRated: Codable {
    let page: Int?
    let results: [ResultMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Popular
struct Popular: Codable {
    let page: Int?
    let results: [ResultMovie]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages
        case totalResults
    }
}

// MARK: - Result
struct ResultMovie: Codable, BaseModel {
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




