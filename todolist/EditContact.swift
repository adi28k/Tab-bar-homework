//
//  EditContact.swift
//  todolist
//
//  Created by Adilet Kistaubayev on 14.10.2024.
//

import UIKit

class EditContactViewController:UIViewController {
    
    
    @IBOutlet weak var editField1: UITextField!
    
    
    @IBOutlet weak var editField2: UITextField!
    
    
    
    @IBOutlet weak var editField3: UITextField!
    
    var index = 0
    
    var person = TaskItem(name: "",surname: "",cellPhone: "")
    
    var arrayPerson:[TaskItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          editField1.text = person.name
        
          editField2.text = person.surname
        
          editField3.text = person.cellPhone
    }
    
    
    
    @IBAction func editContact(_ sender: Any) {
        let edit = editField1.text!
        
        let edit2 = editField2.text!
        
        let edit3 = editField3.text!
        
        var newTask1 = TaskItem(name: edit,surname: edit2,cellPhone: edit3)
        
        arrayPerson[index] = newTask1
        
        do {

                let encodedata = try JSONEncoder().encode(arrayPerson)
                
                UserDefaults.standard.set(encodedata, forKey: "taskItemArray")
            }
            
         catch {
            print("unable to code \(error)" )
            
            
        }
        
    }
}
