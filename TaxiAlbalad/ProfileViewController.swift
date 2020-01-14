//
//  ProfileViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/13/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)

           navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))

           
       }
    
}
