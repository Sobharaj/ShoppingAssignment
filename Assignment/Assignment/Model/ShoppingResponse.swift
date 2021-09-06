//
//  ListModel.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

        // MARK: - CreateSharedItemResponse
    struct ShoppingResponse: Codable {
        let success: Bool?
        let result: [ResultData]?
    }

    // MARK: - Result
    struct ResultData: Codable {
        let type: String?
        let data: [Datum]?
    }

    // MARK: - Datum
    struct Datum: Codable {
        let imagePath, title: String?
        let mrpPrice, dmartPrice, savePrice: Int?
        let quantity: String?
    }
