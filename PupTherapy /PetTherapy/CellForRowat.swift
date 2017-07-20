import UIKit

extension GiphyVC {
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: giphCellReuseIdentifier, for: indexPath) as! GifTableViewCell
        
        if showOnlyFavorites {
            cell.img.image = UIImage.gif(data: onlyFavoriteGifs[indexPath.row].data!)
            cell.favoriteBtn.setImage(#imageLiteral(resourceName: "purpleHeartR"), for: .normal)
        } else {
            cell.img.image = UIImage.gif(data: gifDatas[indexPath.row].data!)
            if let x = buttonStates[gifDatas[indexPath.row]] {
                if x == true {
                    cell.favoriteBtn.setImage(#imageLiteral(resourceName: "purpleHeartR"), for: .normal)
                } else {
                    cell.favoriteBtn.setImage(#imageLiteral(resourceName: "WhiteHeartR"), for: .normal)
                }
            } else {
                cell.favoriteBtn.setImage(#imageLiteral(resourceName: "WhiteHeartR"), for: .normal)
            }
        }
        
        cell.btn.addTarget(self, action: #selector(btnPress), for: .touchUpInside)
        cell.btn.tag = indexPath.row
        
        cell.favoriteBtn.addTarget(self, action: #selector(alterFavCount), for: .touchUpInside)
        cell.favoriteBtn.tag = indexPath.row
        
        
        
        return cell
    }
    
    
}//extension

