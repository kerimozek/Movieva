//
//  WatchListVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

protocol WatchListViewModelDelegate: AnyObject {
    func didGetMovies(isDone: Bool)
}


class WatchListVM {
    
    static let shared = WatchListVM()
    weak var delegate: WatchListViewModelDelegate?
    private init () { }
    
    var watchListMovie: [ResultMovie] = []

    func getMovies(complete: @escaping((String?)->())) {
        PopularManager.shared.getPopular { [self] items, errorMessage in
            
            if let items = items {
                self.watchListMovie = items.results!
                self.delegate?.didGetMovies(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetMovies(isDone: false)
        }
    }
    
}
