//
//  ViewController.swift
//  Metal
//
//  Created by Jack Knight on 7/31/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
    @IBOutlet weak var holdTicket: UIButton!
    @IBOutlet weak var closeTicket: UIButton!
    @IBOutlet weak var payTicket: UIButton!
    @IBOutlet weak var closeWeightOnly: UIButton!
    @IBOutlet weak var voidTicket: UIButton!
    
    
    
    
    var currentCustomer: Customer?
    let vc = UIImagePickerController()
    
    
    override func viewDidAppear(_ animated: Bool) {
        if self.currentCustomer == nil {
            let ac = UIAlertController(title: nil, message: "Enter Name:", preferredStyle: .alert)
            self.vc.sourceType = .camera
            self.vc.cameraDevice = .front
            self.vc.delegate = self
            self.vc.showsCameraControls = false
            self.vc.takePicture()
            
            
            let okayAction = UIAlertAction(title: "Okay", style: .default){
                [weak ac] _ in
                guard let name = ac?.textFields?[0].text else {return}
                let upperName = name.uppercased()
                let date = Date()
                self.currentCustomer = Customer(uuid: UUID().uuidString, title: upperName, image: UIImage(named: "face"), receipt: [], payment: 0.00, isCurrent: true, timeStamp: date)
                self.title = upperName
            }
            ac.addTextField { (textField) in
                textField.placeholder = "Name"
                ac.addAction(okayAction)
            }
            self.present(ac, animated: true, completion: nil)
            
        }
    }
    
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
        holdTicket.backgroundColor = .cyan
        holdTicket.layer.borderWidth = 1
        closeTicket.backgroundColor = .cyan
        closeTicket.layer.borderWidth = 1
        payTicket.backgroundColor = .cyan
        payTicket.layer.borderWidth = 1
        closeWeightOnly.backgroundColor = .cyan
        closeWeightOnly.layer.borderWidth = 1
        voidTicket.backgroundColor = .cyan
        voidTicket.layer.borderWidth = 1
        updateTotal()
        
    }
    //    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    //        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage {
    //            currentCustomer?.image = selectedImage
    //            print(selectedImage)
    //            print(currentCustomer?.image)
    //        }
    //                dismiss(animated: true, completion: nil)
    //            }
    //            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    //                dismiss(animated: false, completion: nil)
    //    }
    //         Controller Delegate protocol functions end here
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Weight?", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let weight = Float((ac?.textFields?[0].text)!) else {return}
            for n in MetalController.shared.allMetals.indices {
                if sender.tag == n {
                    let metalToBeAdded = Metal(name: MetalController.shared.allMetals[n].name, price: MetalController.shared.allMetals[n].price, weight: weight)
                    self?.submit(metalToBeAdded)
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in}
        ac.addTextField { (textField) in
            textField.placeholder = "Pounds"
            textField.keyboardType = .decimalPad
            
            ac.addAction(action)
            ac.addAction(cancelAction)
            self.present(ac,animated: true)
        }
        
    }
    
    func submit(_ metal: Metal) {
        currentCustomer?.receipt.insert(metal, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        updateTotal()
        return
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  currentCustomer?.receipt.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "metalCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        let metals = currentCustomer?.receipt[indexPath.row]
        cell.receipt = metals
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentCustomer?.receipt.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateTotal()
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(title: "Tare Weight", message: "Enter Tare Amount", preferredStyle: .alert)
        let action = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak ac] _ in
            guard let weight = Float((ac?.textFields?[0].text)!) else {return}
            let newWeight = (self?.currentCustomer?.receipt[indexPath.row].weight)! - weight
            self?.currentCustomer?.receipt[indexPath.row].weight = newWeight
            self?.updateTotal()
            tableView.reloadData()
            
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in}
        ac.addTextField { (textField) in
            textField.placeholder = "Pounds"
            textField.keyboardType = .decimalPad
            ac.addAction(action)
            ac.addAction(cancelAction)
            self.present(ac,animated: true)
        }
    }
    
    func updateTotal() {
        let total = currentCustomer?.receipt.map { $0.price * $0.weight}.reduce(0, +)
        currentCustomer?.payment = total ?? 0
        let formatter = String(format: "$%.2f", currentCustomer?.payment ?? 0.0)
        totalLabel.text = "Cost: \(formatter)"
    }
    
    @IBAction func holdTicketButtonTapped(_ sender: UIButton) {
        if let customer = currentCustomer {
            CustomerController.shared.updateCustomer(customer)
        }
    }
    
    
    @IBAction func payTicketButtonTapped(_ sender: Any) {
        if let customer = currentCustomer {
            CashboxController.shared.subtract(customer.receipt.map{$0.price * $0.weight}.reduce(0,+))
            print(CashboxController.shared.cash)
            CustomerController.shared.paidCustomers.append(customer)
            CustomerController.shared.deleteCustomer(customer: customer)
        }
    }
    
    @IBAction func closedTicketButtonTapped(_ sender: Any) {
        if let customer = currentCustomer {
                   CustomerController.shared.closedCustomers.append(customer)
                   CustomerController.shared.deleteCustomer(customer: customer)
            
               }
    }
}






