

import Foundation

extension GiphyVC {
    
    func save() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(onlyFavoriteGifs, toFile: GiphyVC.filePath)
        print("Save was successful?", isSuccessfulSave)
        print("filePath: ", GiphyVC.filePath)
    }
}
