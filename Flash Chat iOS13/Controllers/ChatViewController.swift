//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//
//  Created by Likhit Garimella on 08/09/2020.
//  Copyright © 2020 Likhit Garimella. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = K.appName
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signoutError as NSError {
            print("Error signing out: %@", signoutError)
        }
        
    }
    
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "This is a cell"
        return cell
    }
    
}   // #64
