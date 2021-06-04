//
//  AlarmSoundTableViewCell.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//

import UIKit

class AlarmSoundTableViewCell: UITableViewCell {

    
    @IBOutlet weak var soundName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
