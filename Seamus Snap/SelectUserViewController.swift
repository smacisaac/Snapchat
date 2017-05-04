//
//  SelectUserViewController.swift
//  Seamus Snap
//
//  Created by Seamus MacIsaac on 2017-05-03.
//  Copyright © 2017 Seamus MacIsaac. All rights reserved.
//

import UIKit
import Firebase

class SelectUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
        print (snapshot)
            
            
            let user = User()
            user.email = snapshot.value!["email"] as! String
            
           
            //user.email = snapshot.value!["email"] as! String
            
            //user.uid = snapshot.value!.key
            
           // self.user.append.user()
            //self.tableview.reloadData()
        
            
        })

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        cell.textLabel?.text = user.email
        
        return cell
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
