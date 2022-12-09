//
//  CoreDataHelper.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 7.12.2022.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func fetchData() -> [Favorites]? {
        let fetchRequest: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Favorites.date), ascending: false)]
        var fetched: [Favorites] = []
        do {
            fetched = try self.context.fetch(Favorites.fetchRequest())
    
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return fetched
    }
    
    func saveData(title: String, detail: String, movieId: String, image: String, imdb: String, origin: String) {
        let newItem = Favorites(context: context)
        
        newItem.setValue(Date(), forKey: #keyPath(Favorites.date))
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
    
    func deleteData(index: String) {
        let fetchRequest: NSFetchRequest<Favorites> = Favorites.fetchRequest()
        let predicate = NSPredicate(format: "(movieId = %@)", index as CVarArg)
        
        fetchRequest.predicate = predicate
        
        do {
            let context = self.context
            let result = try context.fetch(fetchRequest).first
            
            if let result = result {
                context.delete(result)
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
