//
//  SecondViewController.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/6/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var orderTextView: UITextView!
    @IBOutlet weak var inventoryPicker: UIPickerView!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var salesTaxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateOrderUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        inventoryPicker.reloadAllComponents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func payButton(_ sender: Any) {
        CommonHelpers.alert(message: "Pay on the Mini", viewController: self)
    }
    
    func updateOrderUI() {
        orderTextView.text = POS.order.text
        subtotalLabel.text = "\(POS.order.subTotal)"
        salesTaxLabel.text = "\(POS.order.salesTax)"
        totalLabel.text = "\(POS.order.total)"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return POS.inventory.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String? {
            return POS.inventory.items[row].text
    }
    
    var selectedInventoryItem : Item {
        let selRow = inventoryPicker.selectedRow(inComponent: 0)
        return POS.inventory.items[selRow]
    }
    
    func addSelectedItemToOrder(_ quantity: Int) {
        let invItem = selectedInventoryItem
        let orderItem = OrderItem(invItem.description, price: invItem.price, quantity: quantity)
        POS.order.add(item: orderItem)
        updateOrderUI()
    }
    
    @IBAction func addToOrderButton(_ sender: Any) {
        addSelectedItemToOrder(1)
    }
    
    @IBAction func removeButton(_ sender: Any) {
        addSelectedItemToOrder(-1)
    }
    
}

