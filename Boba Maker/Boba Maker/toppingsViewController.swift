//
//  toppingsViewController.swift
//  Boba Maker
//
//  Created by Evan Chang on 12/07/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation
import UIKit

class toppingsViewController : UIViewController {
    
    var typeofTea : String?
    var boba : Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func yesBoba(_ sender: Any) {
        boba = true
        performSegue(withIdentifier: "toppingToDone", sender: Any?.self)
    }
    
    @IBOutlet weak var noBoba: UIButton!
    
    @IBAction func noBoba(_ sender: Any) {
        boba = false
        performSegue(withIdentifier: "toppingToDone", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "toppingToDone" {
                if let dest = segue.destination as? doneViewController {
                    dest.typeofTea = self.typeofTea
                    dest.boba = self.boba
                }
            }
        }
    }
}
