//
//  GridTableViewCell.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class GridTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak private var gridCollectionView: CustomCollectionView!
    private var refreshListUI: (() -> Void)?

    var item : [Datum] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
       self.setupContent()
    }
    func setupContent() {
        if let collectionsLayout = gridCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionsLayout.itemSize = UICollectionViewFlowLayout.automaticSize
            collectionsLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            collectionsLayout.sectionInset = .zero
            gridCollectionView.collectionViewLayout = collectionsLayout
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        }
    
    func configure(data: [Datum], onUnlinkCollection: (() -> Void)?) {
        self.refreshListUI = onUnlinkCollection
        self.item = data
        self.gridCollectionView.reloadData()
        self.gridCollectionView.layoutIfNeeded()
        self.refreshListUI!()
        self.layoutIfNeeded()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath as IndexPath) as! GridCollectionViewCell
        cell.configure(data: self.item[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 170.0)
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: .zero, left: 5.0, bottom: .zero, right: 5.0)
    }

    }


