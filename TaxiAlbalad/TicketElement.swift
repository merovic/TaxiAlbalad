//
//  TicketElement.swift
//  TaxiAlbalad
//
//  Created by mac on 1/15/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import Foundation

// MARK: - TicketElement
struct TicketElement: Codable {
    let id, idUser, numberUpFive, numberDownFive: Int
    let stationArrive, dateArrive, timeArrive, typrTicket: String
    let datee: String

    enum CodingKeys: String, CodingKey {
        case id
        case idUser = "id_user"
        case numberUpFive = "number_up_five"
        case numberDownFive = "number_down_five"
        case stationArrive = "station_arrive"
        case dateArrive = "date_arrive"
        case timeArrive = "time_arrive"
        case typrTicket = "typr_ticket"
        case datee
    }
}

typealias Ticket = [TicketElement]
