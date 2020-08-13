//
//  CustomerCollectionViewCell.swift
//  Metal
//
//  Created by Jack Knight on 8/5/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class CustomerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cell: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var customer: Customer? {
        didSet {
           updateViews()
        }
    }
    func updateViews() {
        guard let customer = customer else {return}
        cell.layer.borderWidth = 1
        if let timeStamp = customer.timeStamp {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            let formattedTime = formatter.string(from: timeStamp)
            self.timeLabel.text = formattedTime
        }
        self.image = UIImageView(image: customer.image)
        self.name.text = customer.title
        
    }
}
