//
//  ClosedTableViewCell.swift
//  Metal
//
//  Created by Jack Knight on 8/14/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ClosedTableViewCell: UITableViewCell {
    
    
    var closedCustomer: Customer? {
        didSet {
            updateViews()
        }
    }
        
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateViews() {
        guard let customer = closedCustomer else {return}
        self.nameLabel.text = customer.title
        if let timeStamp = customer.timeStamp {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            let formattedTime = formatter.string(from: timeStamp)
            self.dateLabel.text = formattedTime
        }
        let formatter = String(format: "$%.2f", customer.payment)
        self.paymentLabel.text = "\(formatter)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
