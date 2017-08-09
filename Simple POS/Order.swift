//
//  Order.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/7/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import Foundation

class OrderItem : Item {
    override var text : String {
        return "\(self.quantity) \(self.description)"
    }
    var lineItemPrice : Float {
        return Float(self.quantity) * self.price
    }
}

class Order {
    var items : [String:OrderItem] = [:]
    var salesTaxRate : Float
    func add(item: OrderItem) {

        let dictItem = items[item.description]
        if dictItem == nil {
            // first time addition to the dictionary
            if (item.quantity > 0) {
                items [item.description] = item
            }
        }
        else {
            // update the quantity on the orders
            dictItem!.quantity += item.quantity
            if dictItem!.quantity <= 0 {
                items.remove(at: items.index(forKey: item.description)!)
            }
        }
    }
    var count : Int {
        return items.count
    }
    var text : String {
        var orderText : String = ""
        for item in self.items {
            orderText += item.value.text
            orderText += "  $\(item.value.lineItemPrice)"
            orderText += "\n"
        }
        return orderText
    }
    var subTotal : Float {
        var sub : Float = 0.0
        for item in self.items {
            sub += item.value.price * Float(item.value.quantity)
        }
        return sub
    }
    var salesTax : Float {
        var tax = self.subTotal * self.salesTaxRate
        tax = round(tax*100.0)/100.0
        return tax
    }
    
    var total : Float {
        return subTotal + salesTax
    }
    
    init (salesTaxRate : Float) {
        if (salesTaxRate < 0) || (salesTaxRate > 1) {
            self.salesTaxRate = 0.0
        } else {
            self.salesTaxRate = salesTaxRate
        }
    }
}
