//
//  MainViewController.swift
//  Metal
//
//  Created by Jack Knight on 8/6/20.
//  Copyright © 2020 Jack Knight. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let randomInt = Int.random(in: 1...100000)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MetalController.shared.addMetal(name: "Metal", price: 0.35)
        MetalController.shared.addMetal(name: "Car Battery", price: 5.00)
        MetalController.shared.addMetal(name: "Batteries", price: 0.15)
        MetalController.shared.addMetal(name: "Brass", price: 1.00)
        MetalController.shared.addMetal(name: "Auto", price: 0.20)
        MetalController.shared.addMetal(name: "ELC Motors", price: 0.15)
        MetalController.shared.addMetal(name: "Radiators", price: 0.85)
        MetalController.shared.addMetal(name: "Hulks", price: 0.45)
        MetalController.shared.addMetal(name: "Engine Block", price: 0.55)
        MetalController.shared.addMetal(name: "Computers", price: 0.95)
        
    }
    
    @IBAction func quickTicket(_ sender: Any) {
            
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
