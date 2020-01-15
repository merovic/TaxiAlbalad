//
//  RegistrationViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class RegistrationViewController: UIViewController,NVActivityIndicatorViewable {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userImage: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userConfirm: UITextField!
    
    var image:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image = "Image"
    }
    
    
    @IBAction func registerClick(_ sender: Any) {
        
        registration(firstName: firstName.text!, lastName: lastName.text!, userPhone: userPhone.text!, userImage: image!, userEmail: userEmail.text!, userPassword: userConfirm.text!)
    }
    
    
    func registration(firstName:String,lastName:String,userPhone:String,userImage:String,userEmail:String,userPassword:String){
        
        self.startAnimating()
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Test Login request
            APIClient.registration(fn: firstName, ln: lastName, email: userEmail, phone: userPhone, pass: userPassword, img: userPassword, completion: { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response)
                        
                        UserDefault.setLogin()
                        
                        self.stopAnimating()
                        
                        if(response == "True")
                        {
                            
                            self.sendCode(email: userEmail)
                            
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ConfirmationPopUpViewController") as! ConfirmationPopUpViewController
                             
                             
                             self.present(newViewController, animated: true, completion: nil)
                        }else
                        {
                            Alert.show("تسجيل جديد", message: "فشل في التسجيل", context: self)
                        }
                        
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    self.stopAnimating()
                    
                    Alert.show("تسجيل جديد", message: "فشل في التسجيل", context: self)
                }
            })
            
        }
    }
    
    
    func sendCode(email:String){
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Test Login request
            APIClient.sendEmail(email: email, completion: { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response)
                       
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    self.stopAnimating()
                    
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
