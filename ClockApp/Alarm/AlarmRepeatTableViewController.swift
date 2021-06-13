//
//  AlarmRepeatTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/5/2.
//

import UIKit

class AlarmRepeatTableViewController: UITableViewController {

     var result:String!
     var results = ["Everyday","Never"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "frequecyCell", for: indexPath) as? FrequencyTableViewCell
        cell?.frequencyLabel.text = results[indexPath.row]
        return cell!
        
    }
    
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    }


}
