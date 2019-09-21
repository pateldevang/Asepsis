//
//  userViewController.swift
//  Asepsis
//
//  Created by Devang Patel on 21/09/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
var arr:[String] = []
var arr1:[String] = []
var t1: String?
var t2: String?
class userViewController: UIViewController {
    
    var handle: DatabaseHandle?
    var ref : DatabaseReference?
    var refreshControl = UIRefreshControl()
    
    //MARK: - Outlets
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        table.addSubview(refreshControl)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        arr = []
        arr1 = []
        ref = Database.database().reference()
        handle = ref?.child("id").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
                arr.append(item)
                self.table.reloadData()
            }
        })
        handle = ref?.child("users").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
                arr1.append(item)
            }
        })
    }
    @objc func refresh(_ sender: Any) {
        table.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "go"{
            let de = segue.destination as! summaryViewController
            de.test1 = t1 ?? "7030548548"
            de.test2 = t2 ?? "10"
            
        }
    }
    
}

//MARK: - Extensions

extension userViewController: UITableViewDataSource,UITableViewDelegate {
    
    //MARK: - Table View datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        refreshControl.endRefreshing()
        return cell
    }
    // Setting custom row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        t1 = arr[indexPath.row]
        t2 = arr1[indexPath.row]
        performSegue(withIdentifier: "go", sender: Any?.self)
    }
    
}
