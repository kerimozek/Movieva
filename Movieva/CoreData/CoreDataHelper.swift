//
//  CoreDataHelper.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 7.12.2022.
//

import Foundation
import UIKit

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [Favorites]? {
        do {
            return try self.context.fetch(Favorites.fetchRequest())
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func saveData(title: String, detail: String, movieId: String, image: String, imdb: String, origin: String) {
        let newItem = Favorites(context: context)

        newItem.setValue(title, forKey: #keyPath(Favorites.title))
        newItem.setValue(movieId, forKey: #keyPath(Favorites.movieId))
        newItem.setValue(detail, forKey: #keyPath(Favorites.detail))
        newItem.setValue(image, forKey: #keyPath(Favorites.image))
        newItem.setValue(imdb, forKey: #keyPath(Favorites.imdb))
        newItem.setValue(origin, forKey: #keyPath(Favorites.origin))
  
        do {
            try self.context.save()
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func deleteData(index: Int) {
        if let dataArray = fetchData() {
            context.delete(dataArray[index])
            do {
                try self.context.save()
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
