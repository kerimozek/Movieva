//
//  MainViewModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

protocol MainVMDelegate: AnyObject {
    func didGetTopRated(isDone: Bool)
    func didGetPopular(isDone: Bool)
}

class MainVM {
    
    weak var delegate: MainVMDelegate?
    static let shared = MainVM()
    private init () { }
    
    var topRated: [ResultMovie] = []
    var popular: [ResultMovie] = []
    private var page: Int = 1

    func getTopRated(complete: @escaping((String?)->())) {
        TopRatedManager.shared.getTopRated(page: page) { items, errorMessage in
            
            if let items = items {
                self.topRated.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetTopRated(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetTopRated(isDone: false)
        }
    }
    
    func getPopular(complete: @escaping((String?)->())) {
        PopularManager.shared.getPopular(page: page) { items, errorMessage in
            
            if let items = items {
                self.popular.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetPopular(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetPopular(isDone: false)
        }
    }
}

