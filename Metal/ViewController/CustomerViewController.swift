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
        print(CustomerController.shared.receipt.count)
        print(CustomerController.shared.currentCustomers.count)
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
}
