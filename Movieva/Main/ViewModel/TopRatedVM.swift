//
//  TopRatedVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 6.12.2022.
//

import Foundation

protocol TopRatedDelegate: AnyObject {
    func didGetTopRated(isDone: Bool)
}

class TopRatedVM {
    
    weak var delegate: TopRatedDelegate?
    static let shared = TopRatedVM()
    private init () { }
    
    var topRated: [ResultMovie] = []
    
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
}
