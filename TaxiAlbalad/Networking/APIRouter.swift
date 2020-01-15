//
//  APIRouterNew.swift
//  Wassalny
//
//  Created by Apple on 9/30/19.
//  Copyright © 2019 amirahmed. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(email:String,pass:String)
    case registration(fn:String,ln:String,email:String,phone:String,pass:String,img:String)
    case addTicket(id_user:String,number_up_five:String,number_down_five:String,station_arrive:String,date_arrive:String,time_arrive:String,type_ticket:String)
    case getTicket(id_user:String)
    case sendMail(email:String)
    case activate(code:String)
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .login:
           return .get
        case .registration:
            return .get
        case .addTicket:
            return .get
        case .getTicket:
            return .get
        case .sendMail:
            return .get
        case .activate:
            return .get
        }
        
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .login:
           return "/login_user"
        case .registration:
            return "/register"
        case .addTicket:
            return "/insert_ticket"
        case .getTicket:
            return "/select_ticket_by_id_user"
        case .sendMail:
            return "/sendactivemail"
        case .activate:
            return "/entercode_activemail"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        
        switch self {
    
        case .login(let email, let pass):
            return [K.APIParameterKeyLogin.email: email, K.APIParameterKeyLogin.pass: pass]
        case .registration(let fn, let ln, let email, let phone, let pass, let img):
            return [K.APIParameterKeyRegistration.fn: fn, K.APIParameterKeyRegistration.ln: ln, K.APIParameterKeyRegistration.email: email, K.APIParameterKeyRegistration.phone: phone, K.APIParameterKeyRegistration.pass: pass, K.APIParameterKeyRegistration.img: img]
        case .addTicket(let id_user, let number_up_five, let number_down_five, let station_arrive, let date_arrive, let time_arrive, let type_ticket):
            return [K.APIParameterKeyAddTicket.id_user: id_user, K.APIParameterKeyAddTicket.number_up_five: number_up_five, K.APIParameterKeyAddTicket.number_down_five: number_down_five, K.APIParameterKeyAddTicket.station_arrive: station_arrive, K.APIParameterKeyAddTicket.date_arrive: date_arrive, K.APIParameterKeyAddTicket.time_arrive: time_arrive, K.APIParameterKeyAddTicket.type_ticket: type_ticket]
        
        case .getTicket(let id_user):
            return [K.APIParameterKeyGetTickets.id_user: id_user]
        case .sendMail(let email):
            return [K.APIParameterKeySendmail.email: email]
        case .activate(let code):
            return [K.APIParameterKeyActivate.code: code]
        }
}
    
// MARK: - URLRequestConvertible
func asURLRequest() throws -> URLRequest {
    
    let url = try K.ProductionServer.baseURL.asURL()
    
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
    // HTTP Method
    urlRequest.httpMethod = method.rawValue
    
    // Common Headers
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    
    
    // Parameters
    var encodedURLRequest:URLRequest? = nil
    
    var Vparameters: [String: Any]
    
    if(parameters == nil)
    {
        encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: nil)
    }else
    {
        Vparameters = parameters!
        encodedURLRequest = try URLEncoding.queryString.encode(urlRequest, with: Vparameters)
    }

    
    return encodedURLRequest!
    
    }
}
