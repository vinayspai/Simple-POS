//
//  Inventory.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/7/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import Foundation

class Item {
    private static var uniqueIDCounter : Int = 0
    var description : String
    private var itemPrice : Float
    var price : Float {
        return itemPrice
    }
    var uniqueID : String
    var quantity : Int

    var text : String {
        return "\(self.description): $\(self.price)"
    }
    init (_ description: String, price: Float, quantity: Int) {
        self.description = description
        self.itemPrice = round(price*100.0)/100.0
        self.quantity = quantity
        self.uniqueID = "InvItem\(Item.uniqueIDCounter)"
        Item.uniqueIDCounter += 1
    }
}

class Inventory {
    var items : [Item] = []
    func add(item: Item) {
        items.append(item)
    }
    var count : Int {
        return items.count
    }
    func addSampleMenu() {
        add(item: Item("gummy bears", price: 2.25, quantity: 20))
        add(item: Item("cookie", price: 1.00, quantity: 20))
        add(item: Item("Coke", price: 0.75, quantity: 20))
        add(item: Item("Beer", price: 6.97, quantity: 100))
        add(item: Item("Pretzel", price: 1.95, quantity:50))
    }
}
