//
//  Metal.swift
//  Metal
//
//  Created by Jack Knight on 7/31/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import Foundation


class Metal: Equatable {
    
    static func == (lhs: Metal, rhs: Metal) -> Bool {
        return lhs.weight == rhs.weight
        
    }
    var name: String
    var price: Float
    var weight: Float

    init(name: String, price: Float, weight: Float = 0) {
        self.name = name
        self.price = price
        self.weight = weight
        
    }
}
