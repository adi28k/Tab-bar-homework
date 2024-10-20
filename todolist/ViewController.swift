//
//  ViewController.swift
//  todolist
//
//  Created by Adilet Kistaubayev on 07.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var textField2: UITextField!
    
    
    @IBOutlet weak var textField3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        let task = textField.text!
        
        let task2 = textField2.text!
        
        let task3 = textField3.text!
        
        var newTask = TaskItem(name: task,surname: task2,cellPhone: task3 )
        
        do {
            if let data = UserDefaults.standard.data(forKey: "taskItemArray") {
                
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
            else {
                let encodedata = try JSONEncoder().encode([newTask])
                
                UserDefaults.standard.set(encodedata,forKey: "taskItemArray")
            }
            
        } catch {
            print("unable to code \(error)" )
        }
        
        
        
        
        
        
        /*
         if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
         var array = taskArray
         
         array.append(task)
         
         UserDefaults.standard.setValue(array, forKey: "taskArray")
         
         }
         else {
         UserDefaults.standard.setValue([task], forKey: "taskArray")
         }
         */
        
        textField.text = ""
        textField2.text = ""
        textField3.text = ""
        
    }
}
