//
//  WorldClockTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/4/6.
//
//  ,AddTimeZones
 

import UIKit


class WorldClockTableViewController: UITableViewController ,AddTimeZones{
    
   var addTimeZones = [String]()


    func addTimeZone(addedTimeZone:String){
        addTimeZones.append(addedTimeZone)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addTimeZones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addWorldClockCell", for: indexPath) as? WorldClockTableViewCell
        cell?.timezoneName.text = addTimeZones[indexPath.row].components(separatedBy: "/").last!
        cell?.invisibleLabel.text = addTimeZones[indexPath.row]
        
        return cell!
    
    }
    


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let setTimeZoneVC = segue.destination as? TimeZoneListTableViewController {
            setTimeZoneVC.showTimeZoneDelegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            addTimeZones.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    }
    
    

