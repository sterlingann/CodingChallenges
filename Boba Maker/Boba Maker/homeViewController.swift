//
//  homeViewController.swift
//  Boba Maker
//
//  Created by Evan Chang on 12/07/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation
import UIKit
import ForecastIO

class homeViewController : UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData { (values) in
            if (values < Float(65)) {
                self.tempLabel.text = "The temperature is currently \(values) \u{00B0}F! You should get your boba hot!"
            } else {
                self.tempLabel.text = "The temperature is currently \(values) \u{00B0}F! Enjoy your  ice cold boba!"
            }
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "homeToBoba", sender: Any?.self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "homeToBoba" {
                if let dest = segue.destination as? bobaViewController {
                    dest.name = nameTextField.text
                }
            }
        }
    }
    
    func fetchData(andOnCompletion completion:@escaping (Float)->()){
        var values = Float()
        let secret = "2322ff99a4fb1c71bc582476793e0af1"
        let client = DarkSkyClient(apiKey: secret)
        let myLat = 37.872618
        let myLon = -122.261042
        client.getForecast(latitude: myLat, longitude: myLon) { result in
            switch result {
            case .success(let currentForecast, let requestMetadata):
                values = (currentForecast.currently?.temperature)!
                print(values)
                completion(values)
            case .failure(let error):
                print(error)
            }
        }
    }
}
