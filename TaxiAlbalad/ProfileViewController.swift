//
//  ProfileViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/13/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NVActivityIndicatorViewable {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userPhone: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var segentation: UISegmentedControl!
    @IBOutlet weak var aboutUser: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var ticketsList = Array<TicketElement>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isHidden = true
        
        self.tableView.tableFooterView = UIView()

        if(UserDefault.getImage() != "Image")
        {
            userImage.image = UIImage(named: UserDefault.getImage())
        }
        
        firstName.text = UserDefault.getName()
        lastName.text = UserDefault.getLastName()
        userPhone.text = UserDefault.getMobile()
        userEmail.text = UserDefault.getEmail()
    }
    
    
    
    func getTickets(id_user:String){
        
        ticketsList.removeAll()
        aboutUser.isHidden = true
        tableView.isHidden = true
        self.startAnimating()
        
        DispatchQueue.global(qos: .userInteractive).async {
            // Test Login request
            APIClient.getTickets(id_user: id_user, completion: { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        print(response)
          
                        for i in 0...response.count - 1 {
                                
                            self.ticketsList.append(response[i])
                                
                        }
                            
                            self.tableView.reloadData()
                            self.stopAnimating()
                            self.tableView.isHidden = false
                       
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                    self.stopAnimating()
                    
                    Alert.show("الحجوزات", message: "لا توجد حجوزات", context: self)
                }
            })
            
        }
    }

    
    
    
    
    @IBAction func segmentedChange(_ sender: Any) {
        
        if(segentation.selectedSegmentIndex == 3)
        {
            aboutUser.isHidden = false
            tableView.isHidden = true
        }else if(segentation.selectedSegmentIndex == 2)
        {
            
            getTickets(id_user: String(UserDefault.getID()))
            
        }else if(segentation.selectedSegmentIndex == 1)
        {
            
            getTickets(id_user: String(UserDefault.getID()))
            
        }else if(segentation.selectedSegmentIndex == 0)
        {
            UserDefault.setLogout()
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "InitialNavigationViewController") as! InitialNavigationViewController
                                   
            newViewController.modalPresentationStyle = .fullScreen
                                   
            self.present(newViewController, animated: true, completion: nil)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketsTableViewCell") as! TicketsTableViewCell
        
        cell.date.text = ticketsList[indexPath.row].dateArrive
        cell.time.text = ticketsList[indexPath.row].timeArrive
        cell.station.text = ticketsList[indexPath.row].stationArrive
        cell.type.text = ticketsList[indexPath.row].typrTicket
        
        return cell

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(true)

           navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))

           
       }
    
}
