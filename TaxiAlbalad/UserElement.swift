//
//  UserElement.swift
//  TaxiAlbalad
//
//  Created by mac on 1/14/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import Foundation

// MARK: - UserElement
struct UserElement: Codable {
    let id: Int
    let fn, ln, phone, email: String
    let password, img, datee: String
}

typealias User = [UserElement]
