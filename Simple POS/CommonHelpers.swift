//
//  CommonHelpers.swift
//  Simple POS
//
//  Created by Vinay Pai on 8/7/17.
//  Copyright © 2017 Vinay Pai. All rights reserved.
//

import Foundation
import UIKit

class CommonHelpers {
    /// Pops an alert message dialog box
    ///
    /// - Parameters:
    ///   - text: Text to display in the alert
    ///   - title: Title of the alert
    
    static func alert(message text: String, viewController: UIViewController, title: String = "Notification") {
        let dialog = UIAlertController(title: title, message: text, preferredStyle: .alert)
        dialog.addAction( UIAlertAction(title: "OK", style: .cancel) )
        viewController.present(dialog, animated: true)
    }
}
