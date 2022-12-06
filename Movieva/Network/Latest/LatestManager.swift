//
//  LatestManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 5.12.2022.
//

import Foundation

class LatestManager {
    
    static let shared = LatestManager()
    
    // MARK: - LATEST API https://api.themoviedb.org/3/movie/now_playing?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=1 -
    
    func getLatest(page: Int, complete: @escaping((Movie?, String?)->())) {
        
        let url = APIURLs.latestMovies(page: page)
        
        NetworkManager.shared.request(type: Movie.self,
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
