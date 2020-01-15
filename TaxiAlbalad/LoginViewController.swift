//
//  LoginViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController,NVActivityIndicatorViewable {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClick(_ sender: Any) {
        
        login(email: emailTextField.text!, password: passwordTextField.text!)
    }
    
    func login(email:String,password:String){
        
        self.startAnimating()
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Test Login request
            APIClient.loginNew(email: email, password: password, completion: { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response)
                        
                        UserDefault.setLogin()
                        
                        UserDefault.setID(response[0].id)
                        UserDefault.setName(response[0].fn)
                        UserDefault.setLastName(response[0].ln)
                        UserDefault.setEmail(response[0].email)
                        UserDefault.setMobile(response[0].phone)
                        
                        self.stopAnimating()
                        
                       let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                       let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                        
                        newViewController.modalPresentationStyle = .fullScreen
                        
                        self.present(newViewController, animated: true, completion: nil)
                        
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    self.stopAnimating()
                    
                    Alert.show("تسجيل الدخول", message: "بيانات الدخول خطأ", context: self)
                }
            })
            
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)

            navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))
                   
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "رجوع", style: .plain, target: nil, action: nil)
                  
            self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                   
                  
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
           
       }

}
