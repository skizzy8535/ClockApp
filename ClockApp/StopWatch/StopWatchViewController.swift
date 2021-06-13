//  StopWatchViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/9.
//

import UIKit

class StopWatchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    override func viewDidLoad() {
        
        stopWatchLapView.delegate = self
        stopWatchLapView.dataSource = self
        clickLapButton.isEnabled = false
        clickLapButton.setTitleColor(.lightGray, for: .normal)
    }

    
    var startStatus = true
    var canLapStatus = false
    var millSeconds = 0
    var timer = Timer()
    
    
    @IBOutlet weak var stopWatchTime: UILabel!
    
    @IBOutlet weak var startLapButton: UIButton!
    @IBOutlet weak var clickLapButton: UIButton!

    @IBOutlet weak var stopWatchLapView: UITableView!
    
    @IBAction func startStopWatch(_ sender: Any) {
    
 
        if startStatus{
            startStatus = false
            canLapStatus = true
            
            startLapButton.setTitle("Stop" ,for: .normal)
            startLapButton.setTitleColor(.red, for: .normal)
            
            clickLapButton.setTitle("Lap" ,for: .normal)
            clickLapButton.setTitleColor(.white, for: .normal)
            clickLapButton.isEnabled = true

            
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.01), target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
            
           RunLoop.current.add(timer, forMode: .common)
            
        }else{
            
            startStatus = true
            canLapStatus = false
            
            
            startLapButton.setTitle("Start" ,for: .normal)
            startLapButton.setTitleColor(.white, for: .normal)
            
            clickLapButton.setTitle("Reset" ,for: .normal)
            startLapButton.setTitleColor(.green, for: .normal)
            
            
            timer.invalidate()
           }
        
    }
    
    
     var showTimeString = ""
     var calcuMilSec = 0
     var calcuSec = 0
     var calcuMin = 0
     var calcuHour = 0
    
    @objc func countDown(){
        

        
        
        millSeconds += 1
        
        calcuHour = millSeconds/360000
        calcuMin =  millSeconds/6000
        calcuSec = (millSeconds/100)%60
        calcuMilSec = millSeconds%100
        
        let showHour = calcuHour>9 ? "\(calcuHour)":"0\(calcuHour)"
        let showMin =  calcuMin>9 ? "\(calcuMin)" : "0\(calcuMin)"
        let showSec = calcuSec>9 ? "\(calcuSec)":"0\(calcuSec)"
        let showMilSec = calcuMilSec>9 ?"\(calcuMilSec)":"0\(calcuMilSec)"
        
        
        showTimeString = calcuMin>59 ? "\(showHour):\(showMin):\(showSec).\(showMilSec)": "\(showMin):\(showSec):\(showMilSec)"
        
        stopWatchTime.text = showTimeString
        
    }
    
    
   
    @IBAction func lapStopWatch(_ sender: UIButton) {
       
        if canLapStatus{
            stopWatches.insert(stopWatchTime.text!,at: 0)
            stopWatchLapView.reloadData()
        }else{
            stopWatches.removeAll()
            stopWatchLapView.reloadData()
            millSeconds = 0
            calcuMilSec = 0
            calcuSec = 0
            calcuMin = 0
            calcuHour = 0
            stopWatchTime.text = "00:00:00"
            startStatus = true
            canLapStatus = false
            clickLapButton.setTitle("Lap" ,for: .normal)
            clickLapButton.setTitleColor(.white, for: .normal)
            
        }
        
    }
    
    
    var stopWatches = [String]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stopWatches.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopWatchCell", for: indexPath) as? StopWatchCell
        
        cell?.lapLabel.text = "  Lap\( stopWatches.count-indexPath.row) "
        cell?.timerResultLabel.text = "\(stopWatches[indexPath.row])"
        

        return cell!
    

        
   }
    

    
    
}
