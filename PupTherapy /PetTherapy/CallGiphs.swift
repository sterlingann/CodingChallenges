
import UIKit
import Foundation


extension GiphyVC
{
    func getSetGifs()
    {
        Get.shared.firstGiphData()
        {
            (gifArr, chosenAnimal) in
            
            
            Get.shared.secondGiphData(giphARr: gifArr, completion:
            { (dataArr) in
                
                List.shared.animalURLs += [chosenAnimal]
                for dict in dataArr {
                    var dictionary = dict
                    dictionary[kYoutubeURL] = chosenAnimal
                    self.gifDatas.append(Gif(withDictionary: dictionary as NSDictionary))
                }
                
                DispatchQueue.main.async
                {
                    
                    self.activityIndicator.stopAnimating()
                    self.view.isUserInteractionEnabled = true
                    self.activityIndicator2.stopAnimating()
                    self.tableView.reloadData()
                    self.isNewDataLoading = false
                    
                }
            })
        }
    }
}
