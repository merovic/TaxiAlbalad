//
//  RouteDetailsViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class RouteDetailsViewController: UIViewController {

    @IBOutlet weak var routeNameLabel: UILabel!
    @IBOutlet weak var routeDescriptionLabel: UILabel!
    @IBOutlet weak var routeImageView: UIImageView!
    @IBOutlet weak var routeDesctiptionImage: UIImageView!
    
    var routeName:String?
    var routeDescription:String?
    var routeImage:String?
    var routeImageDesc:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        routeNameLabel.text = routeName
        routeDescriptionLabel.text = routeDescription
        routeImageView.image = UIImage(named: routeImage!)
        routeDesctiptionImage.image = UIImage(named: routeImageDesc!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "رجوع", style: .plain, target: nil, action: nil)
        
       
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }


}
