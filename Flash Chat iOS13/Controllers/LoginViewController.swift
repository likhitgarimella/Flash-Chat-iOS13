//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Likhit Garimella on 08/09/2020.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        
        
    }
    
}   // #31
