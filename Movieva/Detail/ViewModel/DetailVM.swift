//
//  DetailVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 7.12.2022.
//

import Foundation


class DetailVM {
    
    
    var favoritesArray = [Favorites]()
    
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
        favoritesArray = coreDataHelper.fetchData() ?? [Favorites]()
    }
    
    func saveData(title: String, detail: String, movieId: String, image: String, imdb: String, origin: String) {
        coreDataHelper.saveData(title: title, detail: detail, movieId: movieId, image: image, imdb: imdb, origin: origin)
    }
    
    func deleteData(index: Int) {
        coreDataHelper.deleteData(index: index)
    }
    
}
