//
//  CategoryTableTableViewController.swift
//  Restaurant
//
//  Created by Fried on 04/12/2018.
//  Copyright © 2018 Fried. All rights reserved.
//

import UIKit

class CategoryTableTableViewController: UITableViewController {
    var categories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // get data from API
        MenuController.shared.fetchCategories { (categories) in
            if let categories = categories {
                self.updateUI(with: categories)
            }
        }
    }

    /// update interface
    func updateUI(with categories: [String]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    /// set cell content
    func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    }
    
    /// pass categories to next controller
    override func prepare(for segue: UIStoryboardSegue, sender:
    Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        }
    }

}
