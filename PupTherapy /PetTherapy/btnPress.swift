import Foundation

import UIKit

extension GiphyVC {
    
    func btnPress(sender: UIButton!) {
        
        let activityVC = UIActivityViewController(activityItems: [self.gifDatas[sender.tag].url], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
