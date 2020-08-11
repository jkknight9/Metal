//
//  MetalController.swift
//  Metal
//
//  Created by Jack Knight on 7/31/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import Foundation


class MetalController: Equatable {
    
    static func == (lhs: MetalController, rhs: MetalController) -> Bool {
        return lhs.receipt == rhs.receipt
    }
    
    var receipt: [Metal] = []
    

    //Source of truth
    static let shared = MetalController()
    
    func remove(metal:Metal) {
        if let removeMetal = receipt.firstIndex(of: metal) {
            receipt.remove(at: removeMetal)
        }
    }
    func addMetal(name:String, price: Float) {
           let newMetal = Metal(name: name, price: price)
           receipt.append(newMetal)
       }
}
