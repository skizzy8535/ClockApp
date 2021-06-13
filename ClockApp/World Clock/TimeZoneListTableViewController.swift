//
//  TimeZoneListTableViewController.swift
//  ClockApp
//
//  Created by 林祐辰 on 2021/4/6.
//AddTimeZones
// WorldClockTableViewController


import UIKit

protocol AddTimeZones {
    func addTimeZone(addedTimeZone:String)
}


class TimeZoneListTableViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchbarView: UISearchBar!

     var timeZones = [String]()
     var showTimeZoneDelegate:WorldClockTableViewController?
    
     override func viewDidLoad() {
     
        timeZones = NSTimeZone.knownTimeZoneNames
        searchbarView.delegate = self
        searchbarView.placeholder = "Choose City...."
        searchbarView.showsCancelButton = true
     }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeZones.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeZoneCell", for: indexPath) as? TimeZoneCell
        cell?.knownTimeZone.text = timeZones[indexPath.row]
        return cell!
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        showTimeZoneDelegate?.addTimeZone(addedTimeZone: timeZones[indexPath.row])
        dismiss(animated: true, completion: nil)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text != "" {
            timeZones = NSTimeZone.knownTimeZoneNames.filter({$0.contains(searchBar.text!)})
        }else{
            timeZones = NSTimeZone.knownTimeZoneNames
        }
        
        tableView.reloadData()
        
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
