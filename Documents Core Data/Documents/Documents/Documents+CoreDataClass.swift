//
//  Documents+CoreDataClass.swift
//  Documents
//
//  Created by Olivia Bishop on 8/29/18.
//  Copyright © 2018 Olivia Bishop. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Documents)
public class Documents: NSManagedObject {
    
    
    convenience init?(name: String?, contents: String?) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Documents.entity(), insertInto: managedContext)
        
        self.name = name
        self.contents = contents
        
        
        
    }
    
    
}
            
    
        


