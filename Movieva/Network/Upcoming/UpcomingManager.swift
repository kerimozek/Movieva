//
//  UpcomingManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 6.12.2022.
//

import Foundation

class UpcomingManager {
    
    static let shared = UpcomingManager()
    
    // MARK: - UPCOMING API https://api.themoviedb.org/3/movie/upcoming?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=1 -
    
    func getUpcoming(page: Int, complete: @escaping((Movie?, String?)->())) {
        
        let url = APIURLs.upcomingMovies(page: page)
        
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
