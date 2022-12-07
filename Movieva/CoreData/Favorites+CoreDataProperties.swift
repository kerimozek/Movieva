//
//  Favorites+CoreDataProperties.swift
//  Movieva
//
//  Created by Mehmet Kerim ÖZEK on 7.12.2022.
//
//

import Foundation
import CoreData


extension Favorites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorites> {
        return NSFetchRequest<Favorites>(entityName: "Favorites")
    }

    @NSManaged public var movieId: String?
    @NSManaged public var title: String?
    @NSManaged public var detail: String?
    @NSManaged public var image: String?
    @NSManaged public var origin: String?
    @NSManaged public var imdb: String?

}

extension Favorites : Identifiable {

}
