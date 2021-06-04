//
//  TimeZoneCell.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/4/3.
//

import UIKit

class TimeZoneCell: UITableViewCell {

    
    
    @IBOutlet weak var knownTimeZone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
