//
//  ViewController.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    var viewModel : ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        self.initializeUI()
    }
    
    func initializeUI()  {
        tableView.tableFooterView = UIView()
        viewModel = ListViewModel()
        self.viewModel?.fetchAllData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.shoppingDataList.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item =  viewModel?.shoppingDataList.value?[indexPath.section]
        if(item?.type == "Grid"){
            return UITableView.automaticDimension
        }else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item =  viewModel?.shoppingDataList.value?[section]
        if(item?.type == "Grid"){
            return 1
        }else{
        return item?.data?.count ?? 0
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item =  viewModel?.shoppingDataList.value?[indexPath.section]
        guard let data = item?.data?[indexPath.row] else {
            return UITableViewCell()
        }
        
        if item?.type == "Banner" {
            guard let bannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell else{
                return UITableViewCell()
            }
            bannerTableViewCell.configure(data:data , height: self.view.frame.height, width: self.view.frame.width) {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
            return bannerTableViewCell
            
        }else if item?.type == "Grid" {
            guard let gridTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GridTableViewCell", for: indexPath) as? GridTableViewCell,
                  let gridData = item?.data
            else{
                return UITableViewCell()
            }
            gridTableViewCell.configure(data: gridData) {
                tableView.beginUpdates()
                tableView.endUpdates()
                self.view.layoutIfNeeded()
            }
            return gridTableViewCell
            
        }
        else if item?.type == "List" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else{
                return UITableViewCell()
            }
            cell.configure(data: data)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
