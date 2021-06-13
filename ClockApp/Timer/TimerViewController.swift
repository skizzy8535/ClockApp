//
//  TimerViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/9.

import UIKit
import UserNotifications


class TimerViewController: UIViewController {

    @IBOutlet weak var countdownTimer: UIDatePicker!
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    

    var seconds = 0
    var startStatus = true
    var pauseStatus = false
    let formatter = DateFormatter()
    var timer = Timer()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        timerLabel.isHidden = true
        pauseBtn.isEnabled = false
        pauseBtn.setTitleColor(.lightGray, for: .normal)
 }
    

    @IBAction func startCountdown(_ sender: Any) {
        
        formatter.dateFormat = "HH"
        let hours = formatter.string(from: countdownTimer.date)
        
        
        formatter.dateFormat = "mm"
        let minutes = formatter.string(from: countdownTimer.date)
        
        seconds = Int(hours)!*60*60 + Int(minutes)!*60
        
        
        if startStatus {
                  
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(countDownHelper), userInfo: nil ,repeats: true)
            
            setupNotification(time: seconds)

            startStatus = false
            startBtn.setTitleColor(.red, for: .normal)
            startBtn.setTitle("Cancel", for: .normal)
            
            countdownTimer.isHidden = true
            timerLabel.isHidden = false
            
            pauseStatus = true
            pauseBtn.setTitleColor(.white, for: .normal)
            pauseBtn.setTitle("Pause", for: .normal)
            pauseBtn.isEnabled = true

            
        }else{
            
            timer.invalidate()
            removeNotification()
            
            startStatus = true
            startBtn.setTitleColor(.white, for: .normal)
            startBtn.setTitle("Start", for: .normal)
            
            
            countdownTimer.isHidden = false
            timerLabel.isHidden = true
            
            pauseStatus = false
            pauseBtn.isEnabled = false
            pauseBtn.setTitleColor(.lightGray, for: .normal)

        }
        
    }
        
    
    @IBAction func pauseCountDown(_ sender: Any) {
        
        if pauseStatus{
            timer.invalidate()
            removeNotification()
            pauseStatus = false
            pauseBtn.setTitle("Resume", for: .normal)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(countDownHelper), userInfo: nil ,repeats: true)
            setupNotification(time: seconds)
            pauseStatus = true
            pauseBtn.setTitle("Pause", for: .normal)
            
        }
        
 }
    
    
    
    @objc func countDownHelper(){
                
        
        seconds -= 1
        let calcuHours = seconds / 3600
        let calcuMinutes = (seconds/60)%60
        let calcuSeconds = seconds%60
        
        
        let showHours = calcuHours > 9 ? "\(calcuHours)" : "0\(calcuHours)"
        let showMinutes = calcuMinutes > 9 ? "\(calcuMinutes)" : "0\(calcuMinutes)"
        let showSeconds = calcuSeconds > 9 ? "\(calcuSeconds)" : "0\(calcuSeconds)"
        
        timerLabel.text = "\(showHours):\(showMinutes):\(showSeconds)"
        
        if seconds <= 0 {
            timer.invalidate()
            return
        }

}
    
    func setupNotification(time:Int){
        let alarmContent = UNMutableNotificationContent()
        alarmContent.title = ""
        alarmContent.body = ""
        alarmContent.sound = UNNotificationSound.default
        
        let alarmTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(time), repeats: false)
        
        let alarmRequest = UNNotificationRequest(identifier: "alarmTrigger", content: alarmContent, trigger: alarmTrigger)
        
        UNUserNotificationCenter.current().add(alarmRequest, withCompletionHandler: nil)
        
    }
    
    func removeNotification(){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["alarmTrigger"])
    }
    
}
