//
//  GridCollectionViewCell.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    
    @IBOutlet weak private var productImageView: UIImageView!
    
    func configure(data: Datum) {
        titleLabel.text = data.title
        guard let imageUrl = URL(string: data.imagePath ?? "") else {
            return
        }
        productImageView.kf.setImage(with: imageUrl)
    }
}
