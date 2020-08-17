//
//  CustomerController.swift
//  Metal
//
//  Created by Jack Knight on 8/5/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit


class CustomerController {
   
    
    var currentCustomers: [Customer] = []
    var paidCustomers: [Customer] = []
    var closedCustomers: [Customer] = []
    
    
    static let shared = CustomerController()
    
    func addCustomerToHeld(customer: Customer) {
        currentCustomers.append(customer)
    }
    
    func addMetalToCustomer(customer: Customer, metal: [Metal]) {
        customer.receipt.append(contentsOf: metal)
    }
    
    func updateCustomer(_ customer: Customer) {
        if !self.currentCustomers.contains(customer) {
        currentCustomers.append(customer)
    }
    
    }
    func close(_ customer: Customer) {
        customer.isCurrent = false
    }

    
    func deleteCustomer(customer: Customer){
        if let removeCustomer = currentCustomers.firstIndex(of: customer) {
            currentCustomers.remove(at: removeCustomer)
        }
    }
}
