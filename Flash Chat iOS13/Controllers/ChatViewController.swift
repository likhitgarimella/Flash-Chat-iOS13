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
import FirebaseDatabase

class ChatViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    
    var messages: [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        tableView.backgroundColor = UIColor.white
        title = K.appName
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        messageTextfield.endEditing(true)
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        let messagesDB = Database.database().reference().child("Messages")
                
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messageTextfield.text!]
                
        messagesDB.childByAutoId().setValue(messageDictionary) { (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Message Saved Successfully!")
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label?.text = messages[indexPath.row].body
        return cell
    }
    
}   // #86
