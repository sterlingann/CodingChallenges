
import UIKit

class GiphyVC: UIViewController {

    let giphCellReuseIdentifier = "giphCellReuseIdentifier"
    var gifDatas = [Gif]()
    let tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()
    var activityIndicator2 = UIActivityIndicatorView()
    var gifCounter = [String: Bool]()
    var isNewDataLoading = false
    let giphyLogoView = UIImageView()
    var buttonStates = [Gif: Bool]()
    var showOnlyFavorites = false
    var onlyFavoriteGifs: [Gif] = GiphyVC.getFavesOrCreate()
    var showingOnlyFavorites = false

}


