//
//  DeviceStatusViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/26/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON


class DeviceStatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var updates = [Update]()
    
    @IBOutlet weak var tableViewUpdates: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableViewUpdates.dataSource = self
        self.tableViewUpdates.delegate = self
        
        // Do any additional setup after loading the view.
        
        initUi()
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
    
    func initUi() {
        
        self.navigationController?.navigationBar.backgroundColor = ui.mainClor
        self.navigationController?.navigationBar.barTintColor = ui.mainClor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    
    @IBOutlet weak var inputTicketNumber: UITextField!
    
    @IBOutlet weak var labelStatus: UILabel!
    
    @IBOutlet weak var tableUpdates: UITableView!
    

    @IBAction func btnCheckPressed(_ sender: Any) {
        
        fetchDeviceStatus(ticket_id: inputTicketNumber.text!)
        
    }
    
    func fetchDeviceStatus(ticket_id: String) {
        
        let url = api.getCheckIn + ticket_id
        
        let request = Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
            if let data = response.data {
                let json = JSON(data: data)
                
                print("Called updates on labelStatus")
                
                let status = json["updates"][0]["status"].stringValue
                
                DispatchQueue.main.async() {
                    
                    self.labelStatus.text = status
                    
                }
                
                
                if(json["updates"].count > 0) {
                    
                    for i in 0...(json["updates"].count - 1) {
                        
                        print(json.count)
                        
                        let _status = json["updates"][i]["status"].stringValue
                        let _content = json["updates"][i]["content"].stringValue
                        let _check_in_id = Int(json["check_in"]["id"].stringValue)!

                        let _update = Update(content: _content, status: _status, check_in_id: _check_in_id)
                        
                        self.updates.append(_update)
                        
                        self.tableViewUpdates.reloadData()
                        
                    }
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "deviceUpdateCell", for: indexPath) as? DeviceUpdateCell {
            
            let myCell = updates[indexPath.row]
            
            //cell.updateUI(_update: myCell)
            
            cell.updateUI(update: updates[indexPath.row])

            
            
            return cell
            
        } else {
            
            return UITableViewCell()
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return updates.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sender = updates[indexPath.row]
        
        //self.tableActions.deselectSelectedRow(animated: true)
        
        
    }
    

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
