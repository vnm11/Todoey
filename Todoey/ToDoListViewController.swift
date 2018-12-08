//
//  ViewController.swift
//  Todoey
//
//  Created by Vinicius Miclea Serban on 08/12/2018.
//  Copyright © 2018 Vinicius Miclea Serban. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

     let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
    }

    //MARK = Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        
                { tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
            } else {
            
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
                    }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}

