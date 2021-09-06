//
//  Observable.swift
//  Assignment
//
//  Created by sobharaj mohapatra on 30/07/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import UIKit

class Observable<T> {
    
    var value:T? {
        didSet{
            self.valueChanged?(self.value)
        }
    }
    
    private var valueChanged :((T?) -> Void)?
    
    
    init(value: T) {
        self.value = value
    }

    func addObserver(isFireNow : Bool = true, _ onchange: ((T?) -> Void)?) {
        self.valueChanged = onchange
        if(isFireNow){
            onchange?(self.value)
        }
    }
    
}
