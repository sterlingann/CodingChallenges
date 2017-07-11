
import UIKit


extension GiphyVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
        checkConnectivity()
        getSetGifs()
        configureTableView()
        configureFooter()
        configureActivityIndicator()
        
        tableView.backgroundColor = bluePurple
        tableView.addSubview(giphyLogoView)
        tableView.bringSubview(toFront: giphyLogoView)
        
        giphyLogoView.frame = CGRect(x: 0, y: 0, width: 50, height: 70)
        
        giphyLogoView.loadGif(name: "giphyLogo")
        
    }

}
