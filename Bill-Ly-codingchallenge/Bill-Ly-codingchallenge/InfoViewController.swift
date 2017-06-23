//
//  InfoViewController.swift
//  Bill-Ly-codingchallenge
//
//  Created by Billy on 6/22/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var titleFromTableView: UILabel!
   
    
    // Getter/Setter to get data from segue
    var _bobaTitle: String!
   
    
    var bobaTitle: String {
        get {
            return _bobaTitle
        } set {
            _bobaTitle = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleFromTableView.text = bobaTitle
    }

   
    
    @IBAction func returnBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


}
