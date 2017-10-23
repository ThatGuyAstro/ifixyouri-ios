//
//  CheckIn.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/22/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import Foundation

class CheckIn {
    
    private var _customer_name: String!
    private var _customer_phone: String! //Create customer object later
    private var _device_type: String! //Convert to object later
    private var _device_id: String!
    private var _device_issue: String!

    
    var customer_name: String {
        return _customer_name
    }
    
    var customer_phone: String {
        return _customer_phone
    }
    
    var device_type: String {
        return _device_type
    }
    
    var device_id: String {
        return _device_id
    }
    
    var device_issue: String {
        return _device_issue
    }
    
    init(customer_name: String, customer_phone: String, device_type: String, device_id: String, device_issue: String) {
        
        _customer_name = customer_name
        _customer_phone = customer_phone
        _device_type = device_type
        _device_id = device_id
        _device_issue = device_issue
        
        
    }
    
}

