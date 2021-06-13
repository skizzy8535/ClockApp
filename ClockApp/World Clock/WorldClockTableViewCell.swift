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
   
        
    let timeFormatter = DateFormatter()
    let mainTimer = DispatchSource.makeTimerSource(flags: [], queue: .global())
    
  
    override func awakeFromNib() {
        doGCDTimer()
    }
    
    func doGCDTimer(){
        
        
        mainTimer.schedule(deadline: .now(), repeating: .seconds(1))
        
        mainTimer.setEventHandler { [self] in
            
            DispatchQueue.main.async {
                if invisibleLabel.text != "" {
                    timeFormatter.timeStyle = .short
                    timeFormatter.timeZone = TimeZone(identifier: invisibleLabel.text!)
                }
                
                
                let currentTime = Date()
                let parsedGMTTime = timeFormatter.string(from: currentTime)
                timeLabel.text = parsedGMTTime
                
                
                let gmtDiffer = (TimeZone(identifier: invisibleLabel.text!)?.secondsFromGMT())!/3600
                
                gmtDifference.text = "  \(gmtDiffer) Hours"
            }
        }
        
        if mainTimer.isCancelled{return}
        mainTimer.resume()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


