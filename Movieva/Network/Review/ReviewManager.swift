//
//  ReviewManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 6.12.2022.
//

import Foundation

class ReviewManager {
    
    static let shared = ReviewManager()
    
    // MARK: - REVIEW API "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=\(apiKey)&language=en-US&page=1 -
    
    func getReview(movieID: Int, complete: @escaping((Review?, String?)->())) {
        
        let url = APIURLs.review(movieID: movieID)
        
        NetworkManager.shared.request(type: Review.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let items):
                complete(items, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
