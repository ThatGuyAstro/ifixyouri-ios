//
//  SecondViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/22/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Our table view containing options available to user
    @IBOutlet weak var tableActions: UITableView!
    
    //What actions the user can use
    var actions = ["Check repair status", "Check in a device", "Stores near me", /** "Store" **/ ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableActions.dataSource = self
        self.tableActions.delegate = self
        
        initUi()
        
        self.tableActions.reloadData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "idCheckIn" {
            
            if let destination = segue.destination as? CheckInViewController {
                
                //destination.selectedItem = Products[tableView.indexPathForSelectedRow!.row]
                
            }
        }
        
        if segue.identifier == "segueLocations" {
            
            if let destination = segue.destination as? LocationsViewController {
                
                //destination.selectedItem = Products[tableView.indexPathForSelectedRow!.row]
                
            }
        }
        
        if segue.identifier == "segueStore" {
            
            if let destination = segue.destination as? StoreViewController {
                
                //destination.selectedItem = Products[tableView.indexPathForSelectedRow!.row]
                
            }
        }
    }
    
    func initUi() {
        
        self.navigationController?.navigationBar.backgroundColor = ui.mainClor
        self.navigationController?.navigationBar.barTintColor = ui.mainClor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "idActionCell", for: indexPath) as? OptionCell {
            
            let myCell = actions[indexPath.row]
            
            cell.updateUI(label: myCell)
            
            
            return cell
            
        } else {
            
            return UITableViewCell()
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return actions.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sender = actions[indexPath.row]
        
        print(sender)
        
        //Change to switch later
        if(sender == "Check in a device") {
            
            print("Selected - check in a device")
            
            performSegue(withIdentifier: "idCheckIn", sender: sender)

            
        }
        
        if(sender == "Check repair status") {
            
            print("Selected - check repair status")
            
            performSegue(withIdentifier: "idCheckStatus", sender: sender)
            
            
        }
        
        if(sender == "Stores near me") {
            
            print("Selected - stores near me")
            
            performSegue(withIdentifier: "segueLocations", sender: sender)
            
            
        }
        
        if(sender == "Store") {
            
            print("Selected - stores near me")
            
            performSegue(withIdentifier: "segueStore", sender: sender)
            
            
        }
        

        
        //self.tableActions.deselectSelectedRow(animated: true)
        
        
        
        
    }



}

