
import UIKit


extension GiphyVC {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}

