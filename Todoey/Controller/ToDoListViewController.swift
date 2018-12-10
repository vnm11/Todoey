//
//  ViewController.swift
//  Todoey
//
//  Created by Vinicius Miclea Serban on 08/12/2018.
//  Copyright © 2018 Vinicius Miclea Serban. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

     var itemArray = [Item]()
    
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newItem = Item()
        newItem.title = "Find Mike"
    
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Buy Eggos"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Destroy Demogorgon"
        itemArray.append(newItem2)
        
   
        if let  items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }


    }

    //MARK = Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return itemArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        // Ternary operator
        // value condition ? valueTrue :  valueFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
        
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
           //what will happen once the user clicks the Add Item button on out UIAlert
          
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
            
        }
        
        alert.addTextField { (alertTextField) in
        alertTextField.placeholder = "Create new item"
        textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
       
    }
    
    

    
}

