import UIKit

extension GiphyVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let controller = WebViewVC()
        if showingOnlyFavorites {
            
            var indexOfMatchingGif = Int()
            let selectedFavoriteGif = onlyFavoriteGifs[indexPath.row]
            
            for (index, gif) in self.gifDatas.enumerated() {
                if gif == selectedFavoriteGif {
                    indexOfMatchingGif = index
                }
            }
            
            controller.webURLStr = List.shared.animalURLs[indexOfMatchingGif / 30]
            navigationController?.pushViewController(controller, animated: true)
            
        } else {
            controller.webURLStr = List.shared.animalURLs[indexPath.row / 30]
            navigationController?.pushViewController(controller, animated: true)
        }
        
        
        if showingOnlyFavorites {
            controller.webURLStr = onlyFavoriteGifs[indexPath.row].youtubeURL!
        } else {
            controller.webURLStr = gifDatas[indexPath.row].youtubeURL!
        }
    }
}

