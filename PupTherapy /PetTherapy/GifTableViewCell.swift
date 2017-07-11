
import Foundation
import UIKit

class GifTableViewCell: UITableViewCell {
    
    let img = UIImageView()
    let btn = UIButton()
    
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
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(btn)
        let buttonWidth = CGFloat(30)
        let buttonHeight = CGFloat(30)
        let margin = CGFloat(10)
        btn.setBackgroundImage(#imageLiteral(resourceName: "share"), for: .normal)
        btn.frame = CGRect(x: contentView.bounds.width - buttonWidth - margin, y: contentView.bounds.height - buttonHeight - margin, width: buttonWidth, height: buttonHeight)
        
    }
    
       

}
