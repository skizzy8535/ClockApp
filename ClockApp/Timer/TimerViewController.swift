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
    
    
    /*
    var seconds = 0
    var timer = Timer()
    var startStatus = true
    var canPause = false
    let formatter = DateFormatter()
    */
    var startStatus = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    

    @IBAction func startCountdown(_ sender: Any) {
        /*
        
        formatter.dateFormat = "HH"
        let hours = Int(formatter.string(from: countdownTimer.date))
        
        formatter.dateFormat = "mm"
        let minutes = Int(formatter.string(from: countdownTimer.date))
        
    
        seconds = hours!*60*60 + minutes!*60
        */

        
        if startStatus {
            
            /*
            startStatus = false
            startBtn.setTitle("Cancel", for: .normal)
            startBtn.setTitleColor(.red, for: .normal)
            
            
            canPause = true
            pauseBtn.setTitle("Pause", for: .normal)
            pauseBtn.setTitleColor(.white, for: .normal)
            pauseBtn.isEnabled = true
            

            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownHelper), userInfo: nil, repeats: true)
            
             
             countdownTimer.isHidden = true
             timerLabel.isHidden = false
             
            setNotification(at: seconds)
     */

        }else{
            
            /*
            timer.invalidate()
            
            removeNotification()
            
            startStatus = true
            startBtn.setTitle("Start", for: .normal)
            startBtn.setTitleColor(.white, for: .normal)
            
            
            canPause = false
            pauseBtn.isEnabled = false
            pauseBtn.setTitle("Pause", for: .normal)
            pauseBtn.setTitleColor(.white, for: .normal)
            
            
            countdownTimer.isHidden = false
            timerLabel.isHidden = true
            
        }
*/
        }
            
            
    }
        
    
    @IBAction func pauseCountDown(_ sender: Any) {
        
        /*
        if canPause{
            timer.invalidate()
            removeNotification()
            pauseBtn.setTitle("Resume", for: .normal)
            canPause = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDownHelper), userInfo: nil, repeats: true)
            setNotification(at:seconds)
            pauseBtn.setTitle("Pause", for: .normal)
            canPause = true
            
        }
 */
        
        
 }
    
    
    
    @objc func countDownHelper(){
                
        /*
        seconds -= 1
        
        let calcuHours = seconds/3600
        let calcuMinutes = (seconds/60)%60
        let calcuSeconds = seconds%60
        
        
        let showHours = calcuHours > 9 ? "\(calcuHours)" : "0\(calcuHours)"
        let showMinutes = calcuMinutes > 9 ? "\(calcuMinutes)" : "0\(calcuMinutes)"
        let showSeconds = calcuSeconds > 9 ? "\(calcuSeconds)" : "0\(calcuSeconds)"
        
        
        let realTime = "\(showHours):\(showMinutes):\(showSeconds)"
        timerLabel.text = realTime
        
        
        if seconds<=0{
            timer.invalidate()
            return
        }
        
     */
        
    }
    
    
    
    /*
    func setNotification(at:Int) {
        
        let timerContent = UNMutableNotificationContent()
        timerContent.title = "Time's Up"
        timerContent.body = "Wakie Wakie"

        let timerTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(at), repeats: false)

        let timerRequest = UNNotificationRequest(identifier: "addTimerAlert", content: timerContent, trigger: timerTrigger)

        
        UNUserNotificationCenter.current().add(timerRequest, withCompletionHandler: nil)
        
    }
    */
    
    
    /*
    func removeNotification(){
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["addTimerAlert"])

    }
    */
}
