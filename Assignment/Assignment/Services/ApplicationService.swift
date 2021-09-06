//
//  ApplicationService.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class ApplicationService: ShoppingService {
    
    static let shared = ApplicationService()
    
    func fetchAllData(compilation: @escaping ([ResultData]?, NSError?) -> Void) {
        
        do {
            if let bundlePath = Bundle.main.path(forResource: "data",
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                let decoder = JSONDecoder()
                
                do{
                    let datalist = try decoder.decode(ShoppingResponse.self, from: jsonData)
                    compilation(datalist.result, nil)
                }catch {
                    compilation(nil, NSError(domain: "Parsing Error", code: 0, userInfo: ["error": "Parsing Error"]))
                }
                
            }
        } catch {
            print(error)
            compilation(nil, NSError(domain: "Error", code: 0, userInfo: ["error": error.localizedDescription]))
        }
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
