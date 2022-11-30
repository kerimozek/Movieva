//
//  PopularManager.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

class PopularManager {
    
    static let shared = PopularManager()
    
    // MARK: - POPULAR https://api.themoviedb.org/3/movie/popular?api_key=fd24fe5ba58021d3f54a2a7c04297951&language=en-US&page=1 -
    
    let url = "\(NetworkHelper.shared.baseUrl)popular?api_key=\(NetworkHelper.shared.apiKey)&language=en-US&page=1"
    
    func getPopular(complete: @escaping((Popular?, String?)->())) {
        NetworkManager.shared.request(type: Popular.self,
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
