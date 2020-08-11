//
//  TableViewCell.swift
//  Metal
//
//  Created by Jack Knight on 7/31/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    
    var receipt: Metal? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let metal = receipt else {return}
        let formatOfPrice = String(format: "$%.2f", metal.price)
        self.nameLabel.text = ("\(metal.name) (\(formatOfPrice))")
        let formatter = String(format: "$%.2f", metal.price*metal.weight)
        self.priceLabel.text = formatter
        self.poundsLabel.text = "\(metal.weight) lbs"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
