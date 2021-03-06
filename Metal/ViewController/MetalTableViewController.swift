//
//  MetalTableViewController.swift
//  Metal
//
//  Created by Jack Knight on 8/12/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class MetalTableViewController: UITableViewController {
    
    var metal: Metal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MetalController.shared.allMetals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "metalCell", for: indexPath)
        let metals = MetalController.shared.allMetals[indexPath.row]
        cell.textLabel?.text = metals.name
        cell.detailTextLabel?.text = "$\(metals.price)"
        return cell
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "Update Price", message: nil, preferredStyle: .alert)
        ac.addTextField { (textfield) in
            textfield.placeholder = "Price"
            textfield.keyboardType = .decimalPad
        }
        ac.addAction((UIAlertAction(title: "Update", style: .default, handler: { (action) in
            guard let price = ac.textFields?[0].text else {return}
            let priceAsFloat = (price as NSString).floatValue
            MetalController.shared.updateMetalPrice(metal: MetalController.shared.allMetals[indexPath.row], price: priceAsFloat)
            tableView.reloadData()
        })))
        present(ac, animated: true)
    }
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

