//
//  ViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/13/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func profileButton(_ sender: Any) {
        
        
        self.tabBarController?.selectedIndex = 3
    }
    
    @IBAction func ticketButton(_ sender: Any) {
        
        self.tabBarController?.selectedIndex = 2
    }
    
    @IBAction func toursButton(_ sender: Any) {
        
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func routesButton(_ sender: Any) {
        
        self.tabBarController?.selectedIndex = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))

        
    }


}

