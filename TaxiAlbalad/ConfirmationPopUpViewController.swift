//
//  ConfirmationPopUpViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/15/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ConfirmationPopUpViewController: UIViewController,NVActivityIndicatorViewable {

    @IBOutlet weak var codeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func activate(code:String){
        
        self.startAnimating()
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Test Login request
            APIClient.activate(code: code, completion: { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response)
                        
                        self.stopAnimating()
          
                        if(response == "True")
                        {
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                             
                             newViewController.modalPresentationStyle = .fullScreen
                             
                             self.present(newViewController, animated: true, completion: nil)
                        }else
                        {
                            Alert.show("التفعيل", message: "الكود خطأ", context: self)
                        }
                       
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    self.stopAnimating()
                    
                    Alert.show("التفعيل", message: "الكود خطأ", context: self)
                }
            })
            
        }
    }
    
    
    @IBAction func activateClicked(_ sender: Any) {
        
        activate(code: self.codeTextField.text!)
    }
    
}
