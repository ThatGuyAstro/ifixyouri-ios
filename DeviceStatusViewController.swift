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


class DeviceStatusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        self.labelStatus.text = "Loading status..."

        
    }
    
    func fetchDeviceStatus(ticket_id: String) {
        
        
        DispatchQueue.main.async() {
            self.labelStatus.text = "Loading..."

        }

        
        var url = api.getCheckIn + ticket_id
        
        let request = Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
//            print(response.result)
//            print(response.value)
            
            if let data = response.data {
                let json = JSON(data: data)
                
                
                
                
                print(json["customer_name"])
                
                print(json["updates"][0]["status"].stringValue)
                
                
                self.labelStatus.text = json["updates"][0]["status"].stringValue
            }
            
            
        }

        
    }
    

}
