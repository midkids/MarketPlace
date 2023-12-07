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

    @NSManaged public var userPk: Int32
    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var rating: Int32
    @NSManaged public var profilePicture: Data?
    @NSManaged public var selling: Listing?

}

extension User : Identifiable {

}
