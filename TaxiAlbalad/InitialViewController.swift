//
//  InitialViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "رجوع", style: .plain, target: nil, action: nil)

        navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))
        
    }

}
