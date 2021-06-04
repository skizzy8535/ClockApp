//
//  AlarmSettingTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//

import UIKit
// SetAlarmProtocol AlarmMenuTableViewController


protocol SetAlarmProtocol {
    func addAlarm(alarmDate:Date,alarmSwitch:Bool,alarmFrequency:String,alarmLabel:String,alarmSound:String,newAlarmIndex:Int)
    
    func updateAlarm(updateDate:Date,updateSwitch:Bool,updateFrequency:String,updateLabel:String,updateSound:String,updateAlarmIndex:Int)
}



class AlarmSettingTableViewController: UITableViewController {

    @IBOutlet weak var alarmPicker: UIDatePicker!
    @IBOutlet weak var repeatTimes: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var soundName: UILabel!
    

    var showAlarmDelegate: AlarmMenuTableViewController?
    
    var isNewAlarm = true
    var existedAlarm:AlarmObject?
    var existedAlarmIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
 
        if let setAlarm = existedAlarm {
            alarmPicker.setDate(setAlarm.time, animated: true)
            repeatTimes.text = setAlarm.frequency
            labelName.text = setAlarm.label
            soundName.text = setAlarm.sound
        }
        
    }

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let segueIndex = indexPath.row
        
        if segueIndex == 0 {
            performSegue(withIdentifier: "ChooseFrequency", sender: nil)
                }else if segueIndex == 1 {
            performSegue(withIdentifier: "ChooseLabelName", sender: nil)
                }else if segueIndex == 2{
            performSegue(withIdentifier: "ChooseSoundName", sender: nil)
                }
        
        
    }

    @IBAction func saveAlarmResults(_ sender: UIBarButtonItem) {
        
        
        let alarmDate = alarmPicker.date
           
        
        if isNewAlarm{
            
            showAlarmDelegate?.addAlarm(alarmDate: alarmDate, alarmSwitch: isNewAlarm, alarmFrequency: repeatTimes.text!, alarmLabel: labelName.text!, alarmSound: soundName.text!,newAlarmIndex:existedAlarmIndex)
        }else{
            showAlarmDelegate?.updateAlarm(updateDate: alarmDate, updateSwitch: isNewAlarm, updateFrequency: repeatTimes.text!, updateLabel: labelName.text!, updateSound: soundName.text!,updateAlarmIndex:existedAlarmIndex)
        }

        self.navigationController?.popViewController(animated: true)
        
    }
    
    

    
    @IBAction func sendFromFrequency(_ segue:UIStoryboardSegue){
        let frequencySource = segue.source as? AlarmRepeatTableViewController
        repeatTimes.text = frequencySource!.result ?? "Never"
    }
    
    @IBAction func sendFromLabelName(_ segue:UIStoryboardSegue){
        let labelSource = segue.source as? AlarmLabelViewController
        labelName.text = labelSource!.nameLabelText.text ?? "Alarm"
    }
    
    @IBAction func sendFromRingToneName(_ segue:UIStoryboardSegue){
        let alarmSource = segue.source as? AlarmSoundTableViewController
        soundName.text = alarmSource!.ringTone ?? "Marimba"
    }
    
    

    
    
    
}
