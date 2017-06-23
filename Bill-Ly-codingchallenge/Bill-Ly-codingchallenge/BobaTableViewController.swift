//
//  BobaTableViewController.swift
//  Bill-Ly-codingchallenge
//
//  Created by Billy on 6/22/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit
import Alamofire

class BobaTableViewController: UITableViewController {

    var spoon: Spoonacular!
    var spoons = [Spoonacular]()
    var titleInfo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadRecipeData {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - API Call
    
    func downloadRecipeData(completed: @escaping DownloadComplete) {
        
       
        let currentRecipeURL = URL(string: CURRENT_SEARCH_URL)!
        
        Alamofire.request(currentRecipeURL, method: .get, headers: HEADERS).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in results{
                        let recipes = Spoonacular(getRecipeLists: obj)
                        self.spoons.append(recipes)
                    }
                }
            }
            completed()
        }
    }
    


    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spoons.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "bobaVC", for: indexPath) as? BobaTableViewCell {
            let data = spoons[indexPath.row]
            cell.configureCell(spoon: data)
            return cell
        } else {
            return BobaTableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataClick = spoons[indexPath.row]
        titleInfo = [dataClick.title]
        
        self.performSegue(withIdentifier: "infoVC", sender: titleInfo)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InfoViewController {
            destination.bobaTitle = titleInfo[0]
        }
    }
    
}

