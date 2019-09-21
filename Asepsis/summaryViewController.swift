//
//  summaryViewController.swift
//  Asepsis
//
//  Created by Devang Patel on 21/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase


class summaryViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var identity: UILabel!
    @IBOutlet weak var weigth: UILabel!
    
    var test1 = String()
    var test2 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identity.text = test1
        weigth.text = test2
    }
    
}
