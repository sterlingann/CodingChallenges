
import Foundation
import UIKit

class GifTableViewCell: UITableViewCell {
    
    let img = UIImageView()
    let btn = UIButton()
    let favoriteBtn = UIButton()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
   
        contentView.addSubview(img)
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
    
        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        img.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




