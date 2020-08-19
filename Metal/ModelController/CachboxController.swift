//
//  CachboxController.swift
//  Metal
//
//  Created by Jack Knight on 8/18/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import Foundation

class CashboxController {
    
    var cash: Float = 10000.00
    
    static let shared = CashboxController()
        
    func addCash(_ amount: Float) {
        cash += amount
    }
    
    func subtract(_ amount: Float) {
        cash -= amount
    }
}
