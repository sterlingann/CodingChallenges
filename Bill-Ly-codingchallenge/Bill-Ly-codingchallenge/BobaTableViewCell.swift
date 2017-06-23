//
//  BobaTableViewCell.swift
//  Bill-Ly-codingchallenge
//
//  Created by Billy on 6/22/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit
import Kingfisher

class BobaTableViewCell: UITableViewCell {

    @IBOutlet weak var bobaPhoto: UIImageView!
    @IBOutlet weak var bobaTitle: UILabel!
    
    func configureCell(spoon: Spoonacular) {
        
        let photoURL = URL(string: "\(URL_IMAGE_BASE)" + spoon.image)
        bobaTitle.text = spoon.title
        bobaPhoto.kf.indicatorType = .activity
        bobaPhoto.kf.setImage(with: photoURL)
    
    }

}
