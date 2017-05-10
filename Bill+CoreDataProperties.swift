//
//  Bill+CoreDataProperties.swift
//  iFood
//
//  Created by iosdev on 9.5.2017.
//  Copyright © 2017 Tien. All rights reserved.
//

import Foundation
import CoreData


extension Bill {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bill> {
        return NSFetchRequest<Bill>(entityName: "Bill");
    }

    @NSManaged public var order: String?
    @NSManaged public var byUser: String?
    @NSManaged public var item: NSSet?
    @NSManaged public var userName: User?

}

// MARK: Generated accessors for item
extension Bill {

    @objc(addItemObject:)
    @NSManaged public func addToItem(_ value: Food)

    @objc(removeItemObject:)
    @NSManaged public func removeFromItem(_ value: Food)

    @objc(addItem:)
    @NSManaged public func addToItem(_ values: NSSet)

    @objc(removeItem:)
    @NSManaged public func removeFromItem(_ values: NSSet)

}
