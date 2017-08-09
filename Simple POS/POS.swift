//
//  POS.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/7/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import Foundation

class POS {
    static var defaultSalesTaxRate : Float = 0.09
    static var inventory = Inventory()
    static var order = Order(salesTaxRate: defaultSalesTaxRate)
}
