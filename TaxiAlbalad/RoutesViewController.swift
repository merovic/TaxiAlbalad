//
//  RoutesViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit

class RoutesViewController: UIViewController {

    
    @IBOutlet weak var route2View: UIView!
    @IBOutlet weak var route1View: UIView!
    @IBOutlet weak var route4View: UIView!
    @IBOutlet weak var route3View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        route1View.addGestureRecognizer(tapGesture)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2))
        route2View.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3))
        route3View.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(handleTap4))
        route4View.addGestureRecognizer(tapGesture4)
    }
    
    @objc func handleTap() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RouteDetailsViewController") as? RouteDetailsViewController
        
        vc?.routeName = "المسار الآول"
        vc?.routeImage = "map1"
        vc?.routeImageDesc = "route1"
        vc?.routeDescription = "من ابراج الباشا الي سوق قابل"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func handleTap2() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RouteDetailsViewController") as? RouteDetailsViewController
        
        vc?.routeName = "المسار الثاني"
        vc?.routeImage = "map2"
        vc?.routeImageDesc = "route2"
        vc?.routeDescription = "من السوق المحمل الي سوق البدو"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func handleTap3() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RouteDetailsViewController") as? RouteDetailsViewController
        
        vc?.routeName = "المسار الثالث"
        vc?.routeImage = "map3"
        vc?.routeImageDesc = "route3"
        vc?.routeDescription = "من الشارع الذهب الي برحه بيت نصيف"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @objc func handleTap4() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RouteDetailsViewController") as? RouteDetailsViewController
        
        vc?.routeName = "المسار الرابع"
        vc?.routeImage = "map4"
        vc?.routeImageDesc = "route4"
        vc?.routeDescription = "من باب المدينه الي مسجد الشافعي"
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)

           navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))

       }


}
