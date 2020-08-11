//
//  ViewController.swift
//  Metal
//
//  Created by Jack Knight on 7/31/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    var customer: Customer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button4.layer.borderWidth = 1
        button5.layer.borderWidth = 1
        button6.layer.borderWidth = 1
        button7.layer.borderWidth = 1
        button8.layer.borderWidth = 1
        button9.layer.borderWidth = 1
        button10.layer.borderWidth = 1
        button11.layer.borderWidth = 1
        button12.layer.borderWidth = 1
        button13.layer.borderWidth = 1
        button14.layer.borderWidth = 1
        button15.layer.borderWidth = 1
        button16.layer.borderWidth = 1
        button17.layer.borderWidth = 1
        button18.layer.borderWidth = 1
        button19.layer.borderWidth = 1
        button20.layer.borderWidth = 1
        button21.layer.borderWidth = 1
        tableView.layer.borderWidth = 1
        totalLabel.layer.borderWidth = 1
        updateTotal()
        print(CustomerController.shared.receipt.count)
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Weight?", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let weight = Float((ac?.textFields?[0].text)!) else {return}
            if sender.tag == 1 {
                let metalToBeAdded = Metal(name: "Metal", price: 0.15, weight: weight)
                self?.submit(metalToBeAdded)
            }
            if sender.tag == 2 {
                let metalToBeAdded = Metal(name: "Car Battery", price: 5.00, weight: weight)
                self?.submit(metalToBeAdded)
            }
            if sender.tag == 3{
                let metalToBeAdded = Metal(name: "Batteries", price: 0.50, weight: weight)
                self?.submit(metalToBeAdded)
            }
            if sender.tag == 4{
                let metalToBeAdded = Metal(name: "Brass", price: 1.00, weight: weight)
                self?.submit(metalToBeAdded)
            }
            if sender.tag == 5 {
                let metalToBeAdded = Metal(name: "Auto", price: 0.35, weight: weight)
                self?.submit(metalToBeAdded)
            }
            if sender.tag == 6{
                let metalToBeAdded = Metal(name: "ELC Motors", price: 3.00, weight: weight)
                self?.submit(metalToBeAdded)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in}
        ac.addTextField { (textField) in
            textField.placeholder = "Pounds"
            textField.keyboardType = UIKeyboardType.numberPad
            
            ac.addAction(action)
            ac.addAction(cancelAction)
            self.present(ac,animated: true)
        }
    }
    
    func submit(_ metal: Metal) {
        CustomerController.shared.receipt.insert(metal, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        updateTotal()
        return
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CustomerController.shared.receipt.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "metalCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        let metals = CustomerController.shared.receipt[indexPath.row]
        cell.receipt = metals
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CustomerController.shared.receipt.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateTotal()
            
        }
    }
    func updateTotal() {
        let total = CustomerController.shared.receipt.map { $0.price * $0.weight}.reduce(0, +)
        let formatter = String(format: "$%.2f", total)
        totalLabel.text = "Cost: \(formatter)"
       
    }
    
    @IBAction func holdTicketButtonTapped(_ sender: UIButton) {
        
    }
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "currentCustomers"  {
    //            let currentCustomer = customer
    //            guard let destinationVC = segue.destination as? CustomerViewController else {return}
    //
    //
    //
    //            }
    //        }
}





