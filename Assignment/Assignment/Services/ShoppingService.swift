//
//  ListService.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit


protocol ShoppingService {
    func fetchAllData(compilation: @escaping (_ list: [ResultData]?, _ error : NSError?) -> Void)
}

extension ServiceInjectable{
    static func inject()-> ShoppingService{
        return ApplicationService.shared
    }
}
