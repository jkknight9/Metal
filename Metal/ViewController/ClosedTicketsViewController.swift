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
    var filteredCustomers: [Customer] {
        let filteredCustomers = CustomerController.shared.paidCustomers.filter {Calendar.current.isDate($0.timeStamp ?? Date(), inSameDayAs: datePicker.date)}
        return filteredCustomers
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        datePicker.datePickerMode = .date
        CustomerController.shared.paidCustomers.reverse()
        todaysPayOut()
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as? ClosedTableViewCell else {return UITableViewCell()}
        let customer = filteredCustomers[indexPath.row]
        cell.closedCustomer = customer
        return cell
    }
     
    func todaysPayOut() {
        let total = CustomerController.shared.paidCustomers.map{$0.payment}.reduce(0,+)
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

