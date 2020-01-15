//
//  TicketsViewController.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class TicketsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,NVActivityIndicatorViewable {

    @IBOutlet weak var belowTextField: UITextField!
    @IBOutlet weak var aboveTextField: UITextField!
    @IBOutlet weak var stationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var ticketTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    let belowPicker = UIPickerView()
    let abovePicker = UIPickerView()
    let stationsPicker = UIPickerView()
    let ticketspicker = UIPickerView()
    
    let numbers = ["1","2","3","4","5"]
    
    let stations = ["محطه شارع قبل امام الشارع الاول"]
    
    let tickets = ["جولة سياحية في المنطقة التاريخية مع مرشد سياحي","توصيل فقط الي معلم معين","جوله لمده ساعه في جده التاريخيه","جوله لمده نص ساعه في جده التاريخيه","جوله المسار الاول"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        belowTextField.inputView = belowPicker
        
        belowPicker.delegate = self
        
        aboveTextField.inputView = abovePicker
        
        abovePicker.delegate = self
        
        stationTextField.inputView = stationsPicker
        
        stationsPicker.delegate = self
        
        ticketTextField.inputView = ticketspicker
        
        ticketspicker.delegate = self

        setupDateTimePicker(mode: .date, field: dateTextField, picker: datePicker)
        setupDateTimePicker(mode: .time, field: timeTextField, picker: timePicker)
        
    }
    
    
    @IBAction func reserveClick(_ sender: Any) {
        
        reserve(userID: String(UserDefault.getID()), below: belowTextField.text!, above: aboveTextField.text!, station: stationTextField.text!, date: dateTextField.text!, time: timeTextField.text!, ticket: ticketTextField.text!)
    }
    
    
    func reserve(userID:String,below:String,above:String,station:String,date:String,time:String,ticket:String){
           
           self.startAnimating()
           
           DispatchQueue.global(qos: .userInteractive).async {
               // Test Login request
            APIClient.addTicket(id_user: userID, number_up_five: below, number_down_five: above, station_arrive: station, date_arrive: station, time_arrive: time, type_ticket: time, completion: { result in
                   switch result {
                   case .success(let response):
                       DispatchQueue.main.async {
                           print(response)
                           
                           self.stopAnimating()
                           
                           if(response == "True")
                           {
                               Alert.show("حجز تذكره", message: "تم الحجز بنجاح", context: self)
                           }else
                           {
                               Alert.show("حجز تذكره", message: "فشل في الحجز", context: self)
                           }
                           
                           
                       }
                   case .failure(let error):
                       print(error.localizedDescription)
                       
                       self.stopAnimating()
                       
                       Alert.show("حجز تذكره", message: "فشل في الحجز", context: self)
                   }
               })
               
           }
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        navigationItem.titleView = UIImageView(image: UIImage(named: "logo3.png"))

        
    }
    
    func setupDateTimePicker(mode:UIDatePicker.Mode, field:UITextField, picker:UIDatePicker){
        //Formate Date
        picker.datePickerMode = mode
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        var doneButton:UIBarButtonItem
        
        if(mode == .time)
        {
            doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donetimePicker))
        }else
        {
            doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        }
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        field.inputAccessoryView = toolbar
        field.inputView = picker
        
    }
    
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateTextField.text = formatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func donetimePicker(){
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "hh:mm a"
        
        timeTextField.text = formatter2.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == belowPicker || pickerView == abovePicker)
        {
            return numbers.count
        }else if(pickerView == stationsPicker)
        {
            return stations.count
        }else if(pickerView == ticketspicker)
        {
            return tickets.count
        }else
        {
            return tickets.count
        }
        
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == belowPicker || pickerView == abovePicker)
        {
            return numbers[row]
        }else if(pickerView == stationsPicker)
        {
            return stations[row]
        }else if(pickerView == ticketspicker)
        {
            return tickets[row]
        }else
        {
            return tickets[row]
        }
        
    }
     
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == belowPicker)
        {
            belowTextField.text = numbers[row]
            
            let stg1 = Int(belowTextField.text!)! * 25
            let stg2 = Int(aboveTextField.text!)! * 25
            
            priceTextField.text = String(stg1 + stg2) + " ريال سعودي"
            
        }else if(pickerView == abovePicker)
        {
            aboveTextField.text = numbers[row]
            
            let stg1 = Int(belowTextField.text!)! * 25
            let stg2 = Int(aboveTextField.text!)! * 25
            
            priceTextField.text = String(stg1 + stg2) + " ريال سعودي"
            
        }else if(pickerView == stationsPicker)
        {
            stationTextField.text = stations[row]
        }else if(pickerView == ticketspicker)
        {
            ticketTextField.text = tickets[row]
        }
        
        self.view.endEditing(true)
        
    }
    

}
