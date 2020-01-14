//
//  Constants.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 26/11/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Foundation

struct K {
    
    struct ProductionServer {

        static let baseURL = "http://taxi.alosboiya.com.sa/taxi.asmx"
    }
    
    
    struct APIParameterKeyLogin {
        static let pass = "pass"
        static let email = "email"
    }
   
    
    struct APIParameterKeyRegistration {
        static let fn = "fn"
        static let ln = "ln"
        static let email = "email"
        static let phone = "phone"
        static let pass = "pass"
        static let img = "img"
    }
    
    struct APIParameterKeyAddTicket {
        static let id_user = "id_user"
        static let number_up_five = "number_up_five"
        static let number_down_five = "number_down_five"
        static let station_arrive = "station_arrive"
        static let date_arrive = "date_arrive"
        static let time_arrive = "time_arrive"
        static let type_ticket = "typr_ticket"
    }
    
    
    

}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/x-www-form-urlencoded"
}

enum Tokenization: String {
    case Token = "h2gj342g34gh2f34hg2f34hg2f4gh2f3g"
}
