//
//  DeviceUpdateCell.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 11/7/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

class DeviceUpdateCell: UITableViewCell {
    
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var textContent: UITextView!



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(update: Update) {
        
        labelStatus.text = update.status
        textContent.text = update.content
        
    }

}
