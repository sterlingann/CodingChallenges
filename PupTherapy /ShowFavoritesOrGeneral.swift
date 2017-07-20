import UIKit

import Foundation

extension GiphyVC {
 
    func showFavoritesOrGeneral(sender: UISegmentedControl!)
    {
           tableView.contentOffset = .zero
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
            
            self.tableView.contentOffset = .zero
            
            self.tableView.layoutIfNeeded()
        })
        
        if sender.selectedSegmentIndex == 0 {
            
            showingOnlyFavorites = false
            showOnlyFavorites = false
            tableView.reloadData()
            
        } else if sender.selectedSegmentIndex == 1 {
            
            showingOnlyFavorites = true
            showOnlyFavorites = true
            tableView.tableFooterView?.isHidden = true
            tableView.reloadData()

        }
   }
} // Giphy extension
