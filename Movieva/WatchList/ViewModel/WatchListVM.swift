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
    private var page: Int = 1
    
    var watchListMovie: [ResultMovie] = []

    func getMovies(complete: @escaping((String?)->())) {
        PopularManager.shared.getPopular(page: page) { [self] items, errorMessage in
            
            if let items = items {
                self.watchListMovie.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetMovies(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetMovies(isDone: false)
        }
    }
}
