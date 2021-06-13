//
//  AlarmMenuCell.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//

import UIKit


// UpdateAlarmProtocol


protocol UpdateAlarmProtocol {
    func updateSwitch(atWhere:Int,switchOn:Bool)
}
 


class AlarmMenuCell: UITableViewCell {

    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    
    var updateSwitchDelegate:AlarmMenuTableViewController?
    var updateIndex:Int?
    
    
    @IBAction func SwitchChanged(_ sender: UISwitch) {

        updateSwitchDelegate?.updateSwitch(atWhere: updateIndex!, switchOn: sender.isOn)

    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
