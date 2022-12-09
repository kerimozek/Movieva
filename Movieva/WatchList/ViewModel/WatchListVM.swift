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
    
    var favoritesArray = [Favorites]()
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
        favoritesArray = coreDataHelper.fetchData() ?? [Favorites]()
    }
}
