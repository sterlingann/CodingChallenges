import UIKit

extension GiphyVC {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: giphCellReuseIdentifier, for: indexPath) as! GifTableViewCell
        cell.img.image = UIImage.gif(data: gifDatas[indexPath.row])
        cell.btn.addTarget(self, action: #selector(btnPress), for: .touchUpInside)
        cell.btn.tag = indexPath.row
        return cell
    }
    
    func btnPress(sender: UIButton!) {
        print("button tapped")
        let activityVC = UIActivityViewController(activityItems: [self.gifDatas[sender.tag]], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
   }

