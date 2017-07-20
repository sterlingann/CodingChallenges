import UIKit

import Foundation

extension GifTableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(favoriteBtn)
        favoriteBtn.setBackgroundImage(#imageLiteral(resourceName: "WhiteHeartR"), for: .normal)
        
        let buttonWidth = CGFloat(30)
        let buttonHeight = CGFloat(30)
        let margin = CGFloat(10)
        
        let btnX = contentView.bounds.width - buttonWidth - margin
        let btnY = contentView.bounds.height - buttonHeight - margin
        
        let favX = contentView.bounds.width - buttonWidth - 2 * margin - buttonWidth
        let favY = contentView.bounds.height - buttonHeight - margin
        
        favoriteBtn.frame = CGRect(x: favX, y: favY, width: buttonWidth, height: buttonHeight)
        
        contentView.addSubview(btn)
        
        btn.setBackgroundImage(#imageLiteral(resourceName: "share"), for: .normal)
        
        btn.frame = CGRect(x: btnX, y: btnY, width: buttonWidth, height: buttonHeight)
        
    }
}
