//
//  CustomerViewController.swift
//  Metal
//
//  Created by Jack Knight on 8/5/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit

class CustomerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {


    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CustomerController.shared.currentCustomers.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customerCell", for: indexPath) as? CustomerCollectionViewCell else {return UICollectionViewCell()}
        let customer = CustomerController.shared.currentCustomers[indexPath.row]
        cell.customer = customer
        return cell
        
    }
    
    @IBAction func goHomeButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateCustomer" {
            guard let destinationVC = segue.destination as? ViewController else {return}
            if let cell = sender as? CustomerCollectionViewCell {
                if let indexPath = collectionView.indexPath(for: cell) {
                    let customer = CustomerController.shared.currentCustomers[indexPath.row]
                    destinationVC.currentCustomer = customer
                    
                }
            }
        }
    }
}
