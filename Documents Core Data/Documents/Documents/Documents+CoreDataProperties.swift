//
//  Documents+CoreDataProperties.swift
//  Documents
//
//  Created by Olivia Bishop on 8/29/18.
//  Copyright © 2018 Olivia Bishop. All rights reserved.
//
//

import Foundation
import CoreData


extension Documents {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Documents> {
        return NSFetchRequest<Documents>(entityName: "Documents")
    }

    @NSManaged public var name: String?
    @NSManaged public var contents: String?
    

}
