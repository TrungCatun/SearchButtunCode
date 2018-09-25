//
//  ViewController.swift
//  SearchButtunCode
//
//  Created by Trung on 9/18/18.
//  Copyright © 2018 TrungCatun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
   
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["mot", " hai", "ba", "bon", "nam", "sau", "bay", "tam", "chin", "muoi"]
    var filteredData = [String]()
    var searchController: UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredData = data
        searchController = UISearchController(searchResultsController: nil) // khoi tao nut search
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self // hien thi ket qua
        tableView.dataSource = self
        
//        tableView.delegate = self
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.searchBar.sizeToFit()
//        definesPresentationContext = true
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = data.filter{(item: String) -> Bool in
                return (item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil)
            }
        } else {
            filteredData = data
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = filteredData[indexPath.row]
        return cell!
    }
    
   
    

    
  

}

