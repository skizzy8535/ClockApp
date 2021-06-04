//
//  WorldClockTableViewCell.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/4/5.
//


import UIKit

class WorldClockTableViewCell: UITableViewCell {

    @IBOutlet weak var gmtDifference: UILabel!
    @IBOutlet weak var timezoneName: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var invisibleLabel: UILabel!
   
    
    /*
    let timerFormatter = DateFormatter()
    let makeTimerQueue = DispatchSource.makeTimerSource(flags: [], queue: .global())
    */

    let formatter = DateFormatter()
    let mainTimer = DispatchSource.makeTimerSource(flags: [], queue: .global())
   
    
    
    
    
    
    override func awakeFromNib() {
        doGCDTimer()
    }
    
    func doGCDTimer(){
        
           /*
        mainTimer.schedule(wallDeadline: .now(), repeating: .seconds(1))
        
        mainTimer.setEventHandler { [self] in
            
            DispatchQueue.main.async {
            
            if invisibleLabel.text != "" {
                dateTimeFormatter.timeStyle = .short
                dateTimeFormatter.timeZone = TimeZone(identifier: invisibleLabel.text!)
            }
            
            
            let currentTime = Date()
            let renderedTime = dateTimeFormatter.string(from: currentTime)
            
            let gmtDifferHours = (TimeZone(identifier: invisibleLabel.text!)?.secondsFromGMT())!/3600
            
        
         
                timeLabel.text = renderedTime
                gmtDifference.text = "  \(gmtDifferHours) Hours"
            }
    
        }
        
        if mainTimer.isCancelled{return}
        
        mainTimer.resume()
        */
        
        
        mainTimer.schedule(wallDeadline: .now(), repeating: .seconds(1))
        
        mainTimer.setEventHandler {
            DispatchQueue.main.async { [self] in
                
                
                if invisibleLabel.text != ""{
                    formatter.timeStyle = .short
                    formatter.timeZone = TimeZone(identifier: invisibleLabel.text!)
                }
                
                let currentTime = Date()
                let timeString = formatter.string(from: currentTime)
                
                timeLabel.text = timeString
                
                
                let gmtDifferHours = (TimeZone(identifier: invisibleLabel.text!)?.secondsFromGMT())!/3600
                
                gmtDifference.text = "  \(gmtDifferHours) Hours"
                
            }
        }
        
        if mainTimer.isCancelled {return}
        
        mainTimer.resume()
    
    }
       
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    
    
}

