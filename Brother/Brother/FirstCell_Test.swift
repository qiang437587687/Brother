//
//  FirstCell_Test.swift
//  Brother
//
//  Created by zhang on 15/11/24.
//  Copyright © 2015年 zhang. All rights reserved.
//

import UIKit

class FirstCell_Test: UITableViewCell {

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var hospital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
