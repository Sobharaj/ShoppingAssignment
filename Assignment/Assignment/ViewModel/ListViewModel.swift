//
//  ListViewModel.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class ListViewModel{
    
    var shoppingDataList = Observable<[ResultData]>(value: [])
    
    struct Dependancies: ServiceInjectable {
        var listService : ShoppingService = inject()
    }
    
    var  dependancy  : Dependancies
    
    init(_ dependancy : Dependancies = .init()) {
        self.dependancy = dependancy
    }
    
    func fetchAllData()  {
        
        dependancy.listService.fetchAllData { (list, error) in
            
            if let er = error{
                print(er.debugDescription)
            }
            
            if let data = list{
                self.shoppingDataList.value = data
            }
            
        }
    }
}
