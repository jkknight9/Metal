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
    
    var closedCustomer: Customer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        datePicker.datePickerMode = .date
        
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        getClosedCustomers()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CustomerController.shared.closedCustomers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as? ClosedTableViewCell else {return UITableViewCell()}
        let customer = CustomerController.shared.closedCustomers[indexPath.row]
        cell.closedCustomer = customer
        return cell
    }
    
    func getClosedCustomers() {
        for i in CustomerController.shared.closedCustomers.indices {
            if datePicker.date == CustomerController.shared.closedCustomers[i].timeStamp {
                CustomerController.shared.closedCustomers.reverse()
            }
            }
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

