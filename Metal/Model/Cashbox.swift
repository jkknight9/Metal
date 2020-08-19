//
//  Cashbox.swift
//  Metal
//
//  Created by Jack Knight on 8/18/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import Foundation

class Cashbox {
    
    let total: Float
    let hundred: Int?
    let fifty: Int?
    let twenty: Int?
    let ten: Int?
    let five: Int?
    let one: Int?
    let quarter: Int?
    
    init(total:Float, hundred: Int = 0, fifty: Int = 0, twenty: Int = 0, ten: Int = 0, five: Int = 0, one: Int = 0, quarter: Int = 0) {
        self.total = total
        self.hundred = hundred
        self.fifty = hundred
        self.twenty = twenty
        self.ten = ten
        self.five = five
        self.one = one
        self.quarter = quarter
    }
}
