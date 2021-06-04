//
//  AlarmSoundTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//

import UIKit

class AlarmSoundTableViewController: UITableViewController {
    
    let ringToneNames = ["Marimba","Opening","Radar","Reflection","Waves","XyloPhone"]
    
    var ringTone:String? = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ringToneNames.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmSoundCell", for: indexPath) as? AlarmSoundTableViewCell
        cell?.soundName.text = ringToneNames[indexPath.row]
        return cell!
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        ringTone = ringToneNames[indexPath.row]
    }
    
    

}
