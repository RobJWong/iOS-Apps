//
//  ItemStore.swift
//  Homepwner
//
//  Created by Robert Wong on 6/21/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        //Call the function, but ignore the result
        //let _ = createItem()
        
        let newItem = Item(random:true)
        allItems.append(newItem)
        
        return newItem
    }
}
