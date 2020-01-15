//
//  TicketsTableViewCell.swift
//  TaxiAlbalad
//
//  Created by mac on 1/15/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class TicketsTableViewCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var station: UILabel!
    @IBOutlet weak var type: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
