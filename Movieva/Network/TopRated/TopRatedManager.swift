//
//  TopRatedManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

class TopRatedManager {
    
    static let shared = TopRatedManager()
    
    // MARK: - TOP RATED https://api.themoviedb.org/3/movie/top_rated?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=1 -
    
    let url = "\(NetworkHelper.shared.baseUrl)top_rated?api_key=\(NetworkHelper.shared.apiKey)&language=en-US&page=1 "
    
    func getTopRated(complete: @escaping((TopRated?, String?)->())) {
        NetworkManager.shared.request(type: TopRated.self,
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
