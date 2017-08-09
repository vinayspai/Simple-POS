//
//  FirstViewController.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/6/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var inventoryTable: UITableView!
    
    @IBOutlet weak var itemDescriptionField: UITextField!
    @IBOutlet weak var itemPriceField: UITextField!
    
    var itemDescription : String {
        let desc = itemDescriptionField?.text
        return desc!
    }
    
    var itemPrice : Float {
        let priceText = itemPriceField?.text
        let price = Float(priceText!)
        if price != nil {
            return price!
        }
        else {
            return 0.0
        }
    }
    
   @IBAction func addItem(_ sender: Any) {
        let desc = itemDescription
        let price = itemPrice
        
        guard (desc != "") else {
            CommonHelpers.alert(message: "Please enter a valid description", viewController: self)
            return
        }
        guard (price >= 0.0) else {
            CommonHelpers.alert(message: "Negative prices are not allowed", viewController: self)
            return
        }
            
        POS.inventory.add(item: Item(desc, price: price, quantity: 0))
        itemDescriptionField.text = ""
        itemPriceField.text = ""
        inventoryTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        POS.inventory.addSampleMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Return the number of items in the inventory
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return POS.inventory.count;
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            let myIdentifier = "InventoryList";
            
            /*
             Retrieve a cell with the given identifier from the table view.
             The cell is defined in the main storyboard: its identifier is InventoryList, and  its selection style is set to None.
             */
            let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: myIdentifier)!
            
            // Set up the cell.
            let item = POS.inventory.items[indexPath.row];
            cell.textLabel?.text = item.text;
            
            return cell;
    }

}

