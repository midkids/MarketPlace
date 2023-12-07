//
//  Listing+CoreDataProperties.swift
//  MarketPlace
//
//  Created by Quentin Ducker on 12/6/23.
//
//

import Foundation
import CoreData


extension Listing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Listing> {
        return NSFetchRequest<Listing>(entityName: "Listing")
    }

    @NSManaged public var image: Data?
    @NSManaged public var isSold: Bool
    @NSManaged public var productDescription: String?
    @NSManaged public var productPrice: Double
    @NSManaged public var productTitle: String?
    @NSManaged public var soldBy: User?

}

extension Listing : Identifiable {

}

// DONT TOUCH
// DONT TOUCH
// DONT TOUCH
// DONT TOUCH
