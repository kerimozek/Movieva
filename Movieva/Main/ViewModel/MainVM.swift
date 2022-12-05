//
//  MainViewModel.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 30.11.2022.
//

import Foundation

@objc protocol MainVMDelegate: AnyObject {
    @objc optional func didGetTopRated(isDone: Bool)
    @objc optional func didGetPopular(isDone: Bool)
    @objc optional func didGetLatest(isDone: Bool)
}

class MainVM {
    
    weak var delegate: MainVMDelegate?
    static let shared = MainVM()
    private init () { }
    
    var topRated: [ResultMovie] = []
    var popular: [ResultMovie] = []
    var latest: [ResultMovie] = []
    private var page: Int = 1

    func getTopRated(complete: @escaping((String?)->())) {
        TopRatedManager.shared.getTopRated(page: page) { items, errorMessage in
            
            if let items = items {
                self.topRated.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetTopRated!(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetTopRated!(isDone: false)
        }
    }
    
    func getPopular(complete: @escaping((String?)->())) {
        PopularManager.shared.getPopular(page: page) { items, errorMessage in
            
            if let items = items {
                self.popular.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetPopular!(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetPopular!(isDone: false)
        }
    }
    
    func getLatest(complete: @escaping((String?)->())) {
        LatestManager.shared.getLatest(page: page) { items, errorMessage in
            
            if let items = items {
                self.latest.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetLatest!(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetPopular!(isDone: false)
        }
    }
}

