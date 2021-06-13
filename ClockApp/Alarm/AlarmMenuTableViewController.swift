//
//  AlarmMenuTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//
// UpdateAlarmProtocol  SetAlarmProtocol


import UIKit
import UserNotifications


class AlarmMenuTableViewController: UITableViewController{
    
    
    var getAlarms = [AlarmObject]()
    var setAlarmIndex :Int = 0
    var checkIndex = 0

    
    
    func addAlarm(alarmDate: Date, alarmSwitch: Bool, alarmFrequency: String, alarmLabel: String, alarmSound: String,newAlarmIndex:Int) {
        
        
        
        var newAlarm = AlarmObject(time: alarmDate, alarmOn: alarmSwitch, frequency: alarmFrequency, label: alarmLabel, sound: alarmSound, index: newAlarmIndex)
        newAlarm.index = setAlarmIndex
        getAlarms.append(newAlarm)
        setNotification(time:newAlarm.time,sound:newAlarm.sound)
        tableView.reloadData()
        
    }
    
    func updateAlarm(updateDate: Date, updateSwitch: Bool, updateFrequency: String, updateLabel: String, updateSound: String,updateAlarmIndex:Int) {

        let updatedAlarm = AlarmObject(time: updateDate, alarmOn: updateSwitch, frequency: updateFrequency, label: updateLabel, sound: updateSound, index: updateAlarmIndex)
         
        getAlarms[updatedAlarm.index] = updatedAlarm
    
         tableView.reloadData()
        
    }
    
    
    func updateSwitch(atWhere: Int, switchOn: Bool) {
        
        var updateSwitchAlarm = getAlarms[atWhere]
        updateSwitchAlarm.alarmOn = switchOn
        
        if switchOn == false{
            removeNotification(at: atWhere)
        }else{
            setNotification(time: updateSwitchAlarm.time, sound: updateSwitchAlarm.sound)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    func setNotification(time:Date,sound:String){
        let alarmContent = UNMutableNotificationContent()
        alarmContent.title = "Time's Up"
        alarmContent.body = "The Ringtone is \(sound)"
        alarmContent.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "\(sound).mp3"))
        
    
        let dateComponents = Calendar.current.dateComponents([.hour,.minute], from: time)
        
        let alarmTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let alarmRequest = UNNotificationRequest(identifier: "setAlarmIndex\(setAlarmIndex)", content: alarmContent, trigger: alarmTrigger)
        UNUserNotificationCenter.current().add(alarmRequest, withCompletionHandler: nil)
        setAlarmIndex+=1
    }
    
    
    
    func removeNotification(at:Int){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["setAlarmIndex\(at)"])
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getAlarms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmMenuCell", for: indexPath) as? AlarmMenuCell
    
         let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        cell?.alarmSwitch.isOn = getAlarms[indexPath.row].alarmOn
        cell?.alarmTime.text = formatter.string(from: getAlarms[indexPath.row].time)
        cell?.updateIndex = indexPath.row
        
        cell?.updateSwitchDelegate = self
        return cell!
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        
        if editingStyle == .delete{
            let num = indexPath.row
            getAlarms.remove(at: num)
            removeNotification(at:num)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
     
        
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setAlarmVC = segue.destination as? AlarmSettingTableViewController
        
        setAlarmVC?.showAlarmDelegate = self
        
        let alarmIndex = tableView.indexPathForSelectedRow?.row
        
        if segue.identifier == "addNewAlarm"  {
            setAlarmVC?.isNewAlarm = true
        }else if segue.identifier == "fixedOldAlarm"{
            setAlarmVC?.isNewAlarm = false
            setAlarmVC?.existedAlarmIndex = alarmIndex!
            setAlarmVC?.existedAlarm = getAlarms[alarmIndex!]
        }
      
    }
}
