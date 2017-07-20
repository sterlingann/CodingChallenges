import UIKit

import Foundation

extension GiphyVC {
    
    func alterFavCount(sender: UIButton!) {
        
        let gifID = gifDatas[sender.tag]
        
        if sender.imageView?.image == #imageLiteral(resourceName: "purpleHeartR") {
            
            //Remove GIF
            DispatchQueue.global(qos: .background).async {
                
                
                if self.showingOnlyFavorites {
                    
                    self.buttonStates[self.onlyFavoriteGifs[sender.tag]] = false
                    
                    self.onlyFavoriteGifs.remove(at: sender.tag)
                    
                    self.save()
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } else {
                    for (index, gifData) in self.onlyFavoriteGifs.enumerated() {
                        
                        if gifData == gifID {
                            
                            self.onlyFavoriteGifs.remove(at: index)
                        }
                    }
                    self.buttonStates[gifID] = false
                }
                self.save()
            }
            sender.setImage(#imageLiteral(resourceName: "WhiteHeartR"), for: .normal)
            
        } else {
            
            //Add GIF
            DispatchQueue.global(qos: .background).async {
                
                var has = false
                
                for gifData in self.onlyFavoriteGifs {
                    
                    if gifData == gifID {
                        
                        has = true
                    }
                }
                if !has {
                    
                    self.onlyFavoriteGifs.insert(gifID, at: 0)
                }
                self.save()
            }
            sender.setImage(#imageLiteral(resourceName: "purpleHeartR"), for: .normal)
            
            buttonStates[gifID] = true
            
        }
    }//alter fav count
}

