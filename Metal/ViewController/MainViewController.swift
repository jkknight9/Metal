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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func quickTicket(_ sender: Any) {
        let ac = UIAlertController(title: nil, message: "Enter Name:", preferredStyle: .alert)
        //        let vc = UIImagePickerController()
        //        vc.sourceType = .camera
        //        vc.cameraDevice = .front
        //        vc.delegate = self
        //        vc.takePicture()
        let okayAction = UIAlertAction(title: "Okay", style: .default){
            [weak ac] _ in
            guard let name = ac?.textFields?[0].text else {return}
            let upperName = name.uppercased()
            CustomerController.shared.newCustomer(uuid: String(self.randomInt), title: upperName, image: UIImage(named: "pic")!, receipt: [])
            
        }
        ac.addTextField { (textField) in
            textField.placeholder = "Name"
            ac.addAction(okayAction)
            self.present(ac,animated: true)
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
    
}
