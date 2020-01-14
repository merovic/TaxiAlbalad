//
//  APIClient.swift
//  Networking
//
//  Created by Alaeddine Messaoudi on 14/12/2017.
//  Copyright © 2017 Alaeddine Me. All rights reserved.
//

import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){
                            
                            (response: DataResponse<T>) in
                            
                            completion(response.result)
        }
    }
    
    
    
    @discardableResult
    private static func performRequestSimple(route:APIRouter, completion: @escaping (Result<String, Error>)->Void) -> DataRequest {
        return AF.request(route)
            .responseString(encoding: String.Encoding.utf8) {
                
                (response) in
                
                completion(response.result)
                
        }
    }
    
    
    //------------------------------------------------------------------
   
    static func loginNew(email: String, password: String, completion:@escaping (Result<[UserElement],Error>)->Void) {
        
        performRequest(route: APIRouter.login(email: email, pass: password), completion: completion)
        
    }
    
    static func registration(fn:String,ln:String,email:String,phone:String,pass:String,img:String, completion:@escaping (Result<String,Error>)->Void) {
        
        performRequestSimple(route: APIRouter.registration(fn: fn, ln: ln, email: email, phone: email, pass: pass, img: img), completion: completion)
        
    }
    
    static func addTicket(id_user:String,number_up_five:String,number_down_five:String,station_arrive:String,date_arrive:String,time_arrive:String,type_ticket:String, completion:@escaping (Result<String,Error>)->Void) {
        
        performRequestSimple(route: APIRouter.addTicket(id_user: id_user, number_up_five: number_up_five, number_down_five: number_down_five, station_arrive: station_arrive, date_arrive: date_arrive, time_arrive: time_arrive, type_ticket: type_ticket), completion: completion)
        
    }
    
    
}
