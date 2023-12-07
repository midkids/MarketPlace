//
//  User+CoreDataProperties.swift
//  MarketPlace
//
//  Created by Quentin Ducker on 12/6/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var rating: Int32
    @NSManaged public var username: String?
    @NSManaged public var itemsSelling: NSSet?

}

// MARK: Generated accessors for itemsSelling
extension User {

    @objc(addItemsSellingObject:)
    @NSManaged public func addToItemsSelling(_ value: Listing)

    @objc(removeItemsSellingObject:)
    @NSManaged public func removeFromItemsSelling(_ value: Listing)

    @objc(addItemsSelling:)
    @NSManaged public func addToItemsSelling(_ values: NSSet)

    @objc(removeItemsSelling:)
    @NSManaged public func removeFromItemsSelling(_ values: NSSet)

}

extension User : Identifiable {

}

// DONT TOUCH
// DONT TOUCH
// DONT TOUCH
// DONT TOUCH
