//
//  TableViewCell.swift
//  iFixYouri Check In
//
//  Created by Sam Elder on 10/25/17.
//  Copyright © 2017 Sam Elder. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(label: String) {
        
        labelTitle.text = label
        
    }

}
