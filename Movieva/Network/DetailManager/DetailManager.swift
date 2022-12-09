//
//  DetailManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 8.12.2022.
//

import Foundation

class DetailManager {
    
    static let shared = DetailManager()
    
    // MARK: - REVIEW API "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=\(apiKey)&language=en-US&page=1 -
    
    func getDetail(movieID: Int, complete: @escaping((MovieDetail?, String?)->())) {
        
        let url = APIURLs.movieDetail(movieID: movieID)
        
        NetworkManager.shared.request(type: MovieDetail.self,
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
