//
//  SearchVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func didGetUpcoming(isDone: Bool)
}


class SearchVM {
    
    static let shared = SearchVM()
    weak var delegate: SearchViewModelDelegate?
    private init () { }
    private var page: Int = 1
    
    var searchMovie: [ResultMovie] = []

    func getUpcoming(complete: @escaping((String?)->())) {
        UpcomingManager.shared.getUpcoming(page: page) { [self] items, errorMessage in
            
            if let items = items {
                self.searchMovie.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetUpcoming(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetUpcoming(isDone: false)
        }
    }
}

