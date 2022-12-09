//
//  DetailVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 7.12.2022.
//

import Foundation

protocol DetailDelegate: AnyObject {
    func didGetMovie(isDone: Bool)
}


class DetailVM {
    
    
    static let shared = DetailVM()
    weak var delegate: DetailDelegate?
    private init () { }
    
    var favoritesArray = [Favorites]()
    let coreDataHelper = CoreDataHelper()
    
    var movieID: Int?
    var movieDetail: MovieDetail?
    
    
    func getMovieDetail(complete: @escaping((String?)->())) {
        
        let id = DetailVM.shared.movieID
        DetailManager.shared.getDetail(movieID: id!) { [self] items, errorMessage in
            
            if let items = items {
                self.movieDetail = items
                print(items)
                self.delegate?.didGetMovie(isDone: true)
               
            }
            complete(errorMessage)
            self.delegate?.didGetMovie(isDone: false)
            
        }
    }
    
    func fetchData() {
        favoritesArray = coreDataHelper.fetchData() ?? [Favorites]()
    }
    
    func saveData(title: String, detail: String, movieId: String, image: String, imdb: String, origin: String) {
        coreDataHelper.saveData(title: title, detail: detail, movieId: movieId, image: image, imdb: imdb, origin: origin)
    }
    
    func deleteData(index: String) {
        coreDataHelper.deleteData(index: index)
    }
    
}
