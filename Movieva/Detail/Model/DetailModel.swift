//
//  DetailModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import Foundation

protocol BaseModel {
    
    var adult: Bool? { get set }
    var backdropPath: String? { get set }
    var genreIDS: [Int]? { get set }
    var id: Int? { get set }
    var originalLanguage: String? { get set }
    var originalTitle: String? { get set }
    var overview: String? { get set }
    var popularity: Double? { get set }
    var posterPath: String? { get set }
    var releaseDate: String? { get set }
    var title: String? { get set }
    var video: Bool? { get set }
    var voteAverage: Double? { get set }
    var voteCount: Int? { get set }
    
    
}
