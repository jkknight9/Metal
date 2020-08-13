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
    
    
    static let shared = CustomerController()
    
//    func newCustomer(uuid: String, title: String, image: UIImage, receipt: [Metal] = []) {
//        let newCustomer = Customer(uuid: uuid, title: title, image: image, receipt: receipt)
//        currentCustomers.append(newCustomer)
//
//    }
    
    func addCustomerToHeld(customer: Customer) {
        currentCustomers.append(customer)
    }
    
    func addMetalToCustomer(customer: Customer, metal: [Metal]) {
        customer.receipt.append(contentsOf: metal)
    }
    
    func updateCustomersReceipt(customer: Customer, receipt: [Metal], payment: Float) {
        customer.receipt = receipt
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
