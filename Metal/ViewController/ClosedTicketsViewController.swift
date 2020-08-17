//
//  ClosedTicketsViewController.swift
//  Metal
//
//  Created by Jack Knight on 8/11/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class ClosedTicketsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var paidCustomer: Customer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        datePicker.datePickerMode = .date
        CustomerController.shared.paidCustomers.reverse()
        todaysPayOut()
        
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        getPaidCustomers()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CustomerController.shared.paidCustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as? ClosedTableViewCell else {return UITableViewCell()}
        let customer = CustomerController.shared.paidCustomers[indexPath.row]
        cell.closedCustomer = customer
        return cell
    }
    
    func getPaidCustomers() {
        for i in CustomerController.shared.closedCustomers.indices {
            if datePicker.date == CustomerController.shared.paidCustomers[i].timeStamp {
                CustomerController.shared.paidCustomers.reverse()
            }
        }
    }
    func todaysPayOut() {
        let total = CustomerController.shared.paidCustomers.map{$0.payment}.reduce(0,+)
        print(total)
        let formatter = String(format: "$%.2f", total)
        title = "Today's payout total = -\(formatter)"
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

