//
//  Device.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/26/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import Foundation

class CustomerDevice {

    private var _type: String!
    private var _serial: String!
    private var _user_id: Int!
    private var _check_in_id: Int!

    
    var type: String {
        return _type
    }
    
    var serial: String {
        return _serial
    }
    
    var user_id: Int {
        return _user_id
    }
    
    var check_in_id: Int {
        return _check_in_id
    }
    
    init(type: String, serial: String, user_id: Int, check_in_id: Int) {
        
        _type = type
        _serial = serial
        _user_id = user_id
        _check_in_id = check_in_id
        
        
    }
    
}
