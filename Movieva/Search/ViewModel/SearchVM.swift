//
//  SearchVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func didGetMovies(isDone: Bool)
}


class SearchVM {
    
    static let shared = SearchVM()
    weak var delegate: SearchViewModelDelegate?
    private init () { }
    
    var searchMovie: [ResultMovie] = []

    func getMovies(complete: @escaping((String?)->())) {
        PopularManager.shared.getPopular { [self] items, errorMessage in
            
            if let items = items {
                self.searchMovie = items.results!
                print(searchMovie.first?.poster_path as Any)
                self.delegate?.didGetMovies(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetMovies(isDone: false)
        }
    }
    
}

