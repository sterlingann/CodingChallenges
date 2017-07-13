//
//  bobaViewController.swift
//  Boba Maker
//
//  Created by Evan Chang on 12/07/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation
import UIKit

class bobaViewController : UIViewController {
    
    var name : String?
    var typeOfTea : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nameInput = name {
            nameTextField.text = "Hello \(nameInput)!"
        } else {
            nameTextField.text = "Hi! I think you forgot to tell me your name!"
        }
    }
    
    @IBOutlet weak var nameTextField: UILabel!
    
    @IBOutlet weak var greenTeaPressed: UIButton!
    
    @IBAction func greenTeaPressed(_ sender: Any) {
        typeOfTea = "green"
        performSegue(withIdentifier: "bobaToTopping", sender: Any?.self)
    }
    
    @IBAction func blackTeaPressed(_ sender: Any) {
        typeOfTea = "black"
        performSegue(withIdentifier: "bobaToTopping", sender: Any?.self)
    }
    
    @IBOutlet weak var blackTeaPressed: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "bobaToTopping" {
                if let dest = segue.destination as? toppingsViewController {
                    dest.typeofTea = self.typeOfTea
                }
            }
        }
    }
}
