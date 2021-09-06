//
//  BannerTableViewCell.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit
import Kingfisher

class BannerTableViewCell: UITableViewCell {
    
    private var refreshListUI: (() -> Void)?

    @IBOutlet weak private var layoutWidth: NSLayoutConstraint!
    
    @IBOutlet weak private var layoutHeight: NSLayoutConstraint!
    
    @IBOutlet weak private var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(data: Datum, height: CGFloat, width: CGFloat, onUnlinkCollection: (() -> Void)?) {
        self.refreshListUI = onUnlinkCollection
        guard let imageUrl = URL(string: data.imagePath ?? "") else {
            return
        }
        if(bannerImageView.image != nil) { return }
        // Download Image
        bannerImageView.kf.setImage(with: imageUrl, placeholder: nil, options: nil) { result in
            switch result {
            case .success(_):
                // Resize Image
                var newHeight = height
                var newWidth = width
                DispatchQueue.main.async {
                    if let image = self.bannerImageView.image {
                        if(image.size.width >= newWidth){
                            let ratio = image.size.width / image.size.height
                            newHeight = newWidth / ratio
                        }
                        else if(image.size.height >= newHeight) {
                            let ratio = image.size.height / image.size.width
                            newWidth = newHeight / ratio
                        } else{
                            newHeight = image.size.height
                            newWidth = image.size.width
                        }
                        
                        self.bannerImageView.frame.size = CGSize(width: newWidth, height: newHeight)
                        self.layoutHeight.constant = newHeight
                        self.layoutWidth.constant = newWidth
                        onUnlinkCollection!()
                    }
                }
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
    }
}
