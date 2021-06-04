//  StopWatchViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/9.
//

import UIKit

class StopWatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    override func viewDidLoad() {
         
        /*
        stopWatchLapView.delegate = self
        stopWatchLapView.dataSource = self
        clickLapButton.isEnabled = false
        clickLapButton.setTitleColor(.lightGray, for: .normal)
        */
        
    }
    
    
    /*
    var stopWatchResults = [String]()
    var timer = Timer()
    
    var millSeconds = 0
    var showMillSeconds = 0
    var showSeconds = 0
    var showMinutes = 0
    var showHours = 0
    
    var startStopWatch = true
    var canLapStopWatch = false
    
    var showedTimeString = ""
    */
    
    
    @IBOutlet weak var stopWatchTime: UILabel!
    
    @IBOutlet weak var startLapButton: UIButton!
    @IBOutlet weak var clickLapButton: UIButton!

    @IBOutlet weak var stopWatchLapView: UITableView!
    
    @IBAction func startStopWatch(_ sender: Any) {
        
        
         /*
        if startStopWatch{
            
            stopWatchTime.text = ""
            
            
            clickLapButton.isEnabled = true
            
            startStopWatch = false
            canLapStopWatch = true
            
            
            startLapButton.setTitle("Stop", for: .normal)
            startLapButton.setTitleColor(.red, for: .normal)
            clickLapButton.setTitle("Lap", for: .normal)
            clickLapButton.setTitleColor(.white, for: .normal)
            
            
            timer = Timer(timeInterval: 0.01, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            
            RunLoop.current.add(timer, forMode: .common)
        }else{
            timer.invalidate()
            
            startStopWatch = true
            canLapStopWatch = false
            
            startLapButton.setTitle("Start", for: .normal)
            startLapButton.setTitleColor(.white, for: .normal)
            clickLapButton.setTitle("Reset", for: .normal)
            clickLapButton.setTitleColor(.green, for: .normal)
            

        }
 
 */
        
        
        
        
                
        
    }
    
    
    
    @objc func countDown(){
        
        
        /*
        millSeconds += 1
        showMillSeconds = millSeconds % 100
        showSeconds = millSeconds / 100
        showMinutes = millSeconds / 6000
        showHours = millSeconds / 360000
        
        let millSecondString = showMillSeconds > 9 ? "\(showMillSeconds)" : "0\(showMillSeconds)"
        
        let secondString = showSeconds > 9 ? "\(showSeconds)" : "0\(showSeconds)"
        
        let minuteString = showMinutes > 9 ? "\(showMinutes)" : "0\(showMinutes)"
      
        let hourString = "\(showHours)"

        showedTimeString = showHours > 0 ? "\(hourString):\(minuteString):\(secondString).\(millSecondString)":"\(minuteString):\(secondString):\(millSecondString)"

        
        stopWatchTime.text = showedTimeString
*/
        
        
        
    }
    
    
   
    @IBAction func lapStopWatch(_ sender: UIButton) {
     
 /*
        if canLapStopWatch{
            stopWatchResults.insert(showedTimeString, at: 0)
            stopWatchLapView.reloadData()
        }else if canLapStopWatch == false {
            stopWatchResults.removeAll()
            stopWatchLapView.reloadData()
            
            millSeconds = 0
            showMillSeconds = 0
            showSeconds = 0
            showMinutes = 0
            showHours = 0
            
            startStopWatch = true
            canLapStopWatch = false
            
            showedTimeString = "00:00:00"
            
            stopWatchTime.text = showedTimeString
        }
 */
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*
        stopWatchResults.count
        */
    
        1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopWatchCell", for: indexPath) as? StopWatchCell
     
        return cell!
        
        
        /*
        cell?.lapLabel.text = "  Lap  \(stopWatchResults.count - indexPath.row)  "
        
        cell?.timerResultLabel.text = stopWatchResults[indexPath.row]
        */
        

        
   }
    
    
    
}


/*
extension StopWatchViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stopWatchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopWatchCell", for: indexPath) as? StopWatchCell
        
        cell?.lapLabel.text = "Lap \(stopWatchs.count-indexPath.row)"
        cell?.timerResultLabel.text = stopWatchs[indexPath.row]
        return cell!
    }
    
}
*/
