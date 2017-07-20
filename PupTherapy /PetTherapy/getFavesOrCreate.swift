import UIKit
import Foundation

extension GiphyVC {
    static func getFavesOrCreate() -> [Gif]
    {
        if let favorites = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Gif] {
            print("OPENED filepath: ", filePath)
            print("we got the saved data", favorites)
            return favorites
        } else {
            print("failed to get save data")
            return [Gif]()
        }
    }
}
