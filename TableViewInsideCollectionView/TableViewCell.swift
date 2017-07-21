//
//  TableViewCell.swift
//  TableViewInsideCollectionView
//
//  Created by prasanth.podalakur on 7/13/17.
//  Copyright © 2017 Kelltontech. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var notificationTitleLabel: UILabel!
    @IBOutlet weak var notificationDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
