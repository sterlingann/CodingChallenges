//
//  BobaClient.swift
//  Bill-Ly-codingchallenge
//
//  Created by Billy on 6/22/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import Foundation

class Spoonacular {

    //search recipe constants
    var _title: String!
    var _id: Int!
    var _image: String!
    
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var id: Int {
        if _id == nil {
            _id = 0
        }
        return _id
    }
    
    var image: String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    
    
    
    init(getRecipeLists: Dictionary<String, AnyObject>) {
        
        if let id = getRecipeLists["id"] as? Int {
            self._id = id
        }
        
        if let title = getRecipeLists["title"] as? String {
            self._title = title
        }
        
        if let image = getRecipeLists["image"] as? String {
            self._image = image
        }
        
        
    }

}
