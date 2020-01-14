//
//  RegistrationViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)

        
         navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))
                
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "رجوع", style: .plain, target: nil, action: nil)
               
               self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
               
                self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
       }
}
