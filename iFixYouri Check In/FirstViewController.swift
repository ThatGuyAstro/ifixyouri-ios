//
//  FirstViewController.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/22/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

import SwiftyJSON
import Alamofire

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
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
    
    @IBAction func btnCreateCheckIn(_ sender: Any) {
        
        createOrder()
        
    }
    
    @IBOutlet weak var inputCustomerName: UITextField!
    
    @IBOutlet weak var inputCustomerPhoneNumber: UITextField!
    
    @IBOutlet weak var inputCustomerDevice: UITextField!
    
    @IBOutlet weak var inputDeviceIssue: UITextField!
    
    
    
    func initUi() {
        
        self.navigationController?.navigationBar.backgroundColor = ui.mainClor
        self.navigationController?.navigationBar.barTintColor = ui.mainClor
        self.navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    func createOrder() {
        
        //Setup object here
        let checkIn = CheckIn(customer_name: inputCustomerName.text!, customer_phone: inputCustomerPhoneNumber.text!, device_type: UIDevice.current.model, device_id: "123", device_issue: inputDeviceIssue.text!)

        //Call postOrder and pass object
        postOrder(_checkIn: checkIn)
        
    }
    
    func postOrder(_checkIn: CheckIn) {
                
        let parameters = [
            "customer_name": _checkIn.customer_name,
            "customer_phone": _checkIn.customer_phone,
            "device_type": _checkIn.device_type,
            "device_id": _checkIn.device_id,
            "device_issue": _checkIn.device_issue
            ]
        
        let request = Alamofire.request(api.createCheckIn, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        request.responseJSON { response in
            
            print(response.result)
            print(response.value)
            
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                print("Failure Response: \(json)")
            }

        
        }
    
    }


}

