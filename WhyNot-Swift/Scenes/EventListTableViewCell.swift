//
//  EventListTableViewCell.swift
//  WhyNot-Swift
//
//  Created by Arthur BLANC on 20/04/2019.
//  Copyright © 2019 Nassim Morouche. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
