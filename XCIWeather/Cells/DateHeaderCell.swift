//
//  DateHeaderCell.swift
//  XCIWeather
//
//  Created by Dmytro on 7/17/19.
//  Copyright © 2019 AttFlederX. All rights reserved.
//

import UIKit

class DateHeaderCell: UITableViewCell {
    
    @IBOutlet weak var dateHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setHeaderCellData(date: Date) {
        dateHeaderLabel.text = date.toString(dateFormat: "MMM dd yyyy")
    }
}
