//
//  DataController.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 15/04/23.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func loadData(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            completion?()
        }
    }
}
