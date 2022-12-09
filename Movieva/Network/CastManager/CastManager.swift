//
//  CastManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 9.12.2022.
//

import Foundation

class CastManager {
    
    static let shared = CastManager()
    
    // MARK: - CAST API "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(apiKey)&language=en-US" -
    
    func getCast(movieID: Int, complete: @escaping((MovieCast?, String?)->())) {
        
        let url = APIURLs.cast(movieID: movieID)
        
        NetworkManager.shared.request(type: MovieCast.self,
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
