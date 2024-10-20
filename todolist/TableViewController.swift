//
//  TableViewController.swift
//  todolist
//
//  Created by Adilet Kistaubayev on 07.10.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayTask:[TaskItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      
        }
    override func viewWillAppear(_ animated: Bool) {
        /* if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
            array = taskArray
            tableView.reloadData()
    } */
        do {
            if let data  = UserDefaults.standard.data(forKey:"taskItemArray") {
                let array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                arrayTask = array
                
                tableView.reloadData()
            }
        }
            catch {
                print("unable to code \(error)" )
            }
        
        }
    
    func saveTask() {
        do {
            let encodedata = try JSONEncoder().encode(arrayTask)
            
            UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
        }
        catch {
            print("unable to code \(error)" )
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayTask.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")

        // Configure the cell...
        
        cell.textLabel?.text = arrayTask[indexPath.row].name + " " +
        arrayTask[indexPath.row].surname
        
        cell.detailTextLabel?.text = arrayTask[indexPath.row].cellPhone
        
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        arrayTask[indexPath.row].isComplete.toggle()
//        
//        saveTask()
//        
//        tableView.reloadData()
        
        let editScreen = storyboard?.instantiateViewController(withIdentifier: "EditScreen") as! EditContactViewController
        
        editScreen.index = indexPath.row
        
        editScreen.person = arrayTask[indexPath.row]
        
        editScreen.arrayPerson = arrayTask
        
        navigationController?.show(editScreen, sender: self)
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayTask.remove(at: indexPath.row)
            
            saveTask()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        
     
    }
 
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
