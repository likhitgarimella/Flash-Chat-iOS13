//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Likhit Garimella on 08/09/2020.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
}

// Dismiss keyboard on tapping anywhere
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}   // #38
