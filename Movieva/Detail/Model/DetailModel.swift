//
//  DetailModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 2.12.2022.
//

import Foundation

protocol BaseModel {
    
    var adult: Bool? { get set }
    var backdrop_path: String? { get set }
    var genre_ids: [Int]? { get set }
    var id: Int? { get set }
    var original_language: String? { get set }
    var original_title: String? { get set }
    var overview: String? { get set }
    var popularity: Double? { get set }
    var poster_path: String? { get set }
    var release_date: String? { get set }
    var title: String? { get set }
    var video: Bool? { get set }
    var vote_average: Double? { get set }
    var vote_count: Int? { get set }
    
    
}
