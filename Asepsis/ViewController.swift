//
//  ViewController.swift
//  Asepsis
//
//  Created by Devang Patel on 21/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var empID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.load.isHidden = true
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
        self.load.isHidden = false
        load.startAnimating()
        Auth.auth().signIn(withEmail: empID.text!, password: password.text!, completion: { user, error in
            
            if let firebaseError = error {
                self.load.isHidden = true
                print(firebaseError.localizedDescription)
                let alert = UIAlertController(title: "Authentication failed", message: "Invalid password please try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                return
            }
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! homeViewController
            self.present(homeView, animated: true, completion: nil)
            print("Success!")
            
        })
    }
    

}

