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
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage, originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}



