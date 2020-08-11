//
//  Customer.swift
//  Metal
//
//  Created by Jack Knight on 8/5/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit


class Customer: Equatable {
    

    var uuid: String
    var title: String
    var image: UIImage?
    var receipt: [Metal] = []
    var payment: Float
    var isCurrent: Bool
    var timeStamp: Date?
    
    init(uuid: String, title: String, image: UIImage? = nil, receipt: [Metal], payment: Float = 0.00, isCurrent: Bool = false, timeStamp: Date = Date()) {
        self.uuid = uuid
        self.title = title
        self.image = image
        self.payment = payment
        self.isCurrent = isCurrent
        self.timeStamp = timeStamp
    }
    
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        if lhs.uuid == rhs.uuid && lhs.timeStamp == rhs.timeStamp {
            return true
        } else {
            return false
        }
    }
}
