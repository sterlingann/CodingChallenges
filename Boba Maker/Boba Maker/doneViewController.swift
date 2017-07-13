//
//  doneViewController.swift
//  Boba Maker
//
//  Created by Evan Chang on 12/07/17.
//  Copyright © 2017 Evan Chang. All rights reserved.
//

import Foundation
import UIKit

class doneViewController : UIViewController {
    
    var typeofTea : String?
    var boba : Bool?
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var drink = ""
        if boba! {
            drink = typeofTea! + "TeaYesBoba"
        } else {
            drink = typeofTea! + "TeaNoBoba"
        }
        image.image = resizeImage(image: UIImage.init(named: drink)!, targetSize: CGSize(width: 213, height: 360))
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    @IBAction func startOver(_ sender: Any) {
        performSegue(withIdentifier: "doneToHome", sender: Any?.self)
    }
}
