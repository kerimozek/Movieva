//
//  LatestVM.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 6.12.2022.
//

import Foundation

protocol LatestDelegate: AnyObject {
    func didGetLatest(isDone: Bool)
}

class LatestVM {
    
    weak var delegate: LatestDelegate?
    static let shared = LatestVM()
    private init () { }
    
    var latest: [ResultMovie] = []
    
    private var page: Int = 1
    
    func getLatest(complete: @escaping((String?)->())) {
        LatestManager.shared.getLatest(page: page) { items, errorMessage in
            
            if let items = items {
                self.latest.append(contentsOf: items.results!)
                self.page += 1
                self.delegate?.didGetLatest(isDone: true)
            }
            complete(errorMessage)
            self.delegate?.didGetLatest(isDone: false)
        }
    }
}
