//
//  Update.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/26/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import Foundation

class Update {
    
    private var _content: String!
    private var _status: String!
    private var _check_in_id: Int!
    
    var content: String {
        return _content
    }
    
    var status: String {
        return _status
    }
    
    var check_in_id: Int {
        return _check_in_id
    }

    
    init(content: String, status: String, check_in_id: Int) {
        
        _content = content
        _status = status
        _check_in_id = check_in_id
        
        
    }
    
}
