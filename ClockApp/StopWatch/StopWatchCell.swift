//
//  StopWatchCell.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/4/7.
//

import UIKit

class StopWatchCell: UITableViewCell {

    

    @IBOutlet weak var lapLabel: UILabel!
    @IBOutlet weak var timerResultLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
