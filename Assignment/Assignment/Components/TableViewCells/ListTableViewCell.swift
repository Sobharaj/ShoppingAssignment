//
//  ListTableViewCell.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var addToListButton: UIButton!
    
    @IBOutlet weak private var quantityButton: UIButton!
    
    @IBOutlet weak private var saveLabel: UILabel!
    
    @IBOutlet weak private var dmartPriceLabel: UILabel!
    
    @IBOutlet weak private var mrpLabel: UILabel!
    
    @IBOutlet weak private var productImageView: UIImageView!
    
    @IBOutlet weak private var productTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(data: Datum) {
        productTitle.text = data.title
        mrpLabel.attributedText = ("MRP ₹" + "\(data.mrpPrice ?? 0)").strikeThrough() 
        dmartPriceLabel.text = "DMart ₹" + "\(data.dmartPrice ?? 0)"
        saveLabel.text = "Save ₹" + "\(data.savePrice ?? 0)"
        quantityButton.setTitle(data.quantity, for: .normal)

        guard let imageUrl = URL(string: data.imagePath ?? "") else {
            return
        }
        productImageView.kf.setImage(with: imageUrl)
    }
}
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
