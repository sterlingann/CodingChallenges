//
//  flavoringViewController.swift
//  Boba Maker
//
//  Created by Evan Chang on 12/07/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation
import UIKit

class flavoringViewController : UIViewController {
    
    var typeofTea : String?
    var flavoring : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "homeToBoba", sender: Any?.self)
    }
    
}
