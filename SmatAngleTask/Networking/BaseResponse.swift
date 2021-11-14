//
//  BaseResponse.swift
//  NetworkLayer
//
//  Created by Elattar on 10/11/20.
//  Copyright © 2020 Shadi Elattar. All rights reserved.
//

import Foundation


class BaseResponseGen<T: Codable>: Codable{
    
    let status: Int?
    let message: String?
    let messages: [String]?
    let errors: [String]?
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
        case data =  "data"
        case messages = "messages"
        case errors = "errors"
    }
}

struct BaseResponse : Codable {
    let status : Int?
    let message : String?
    let errors : [String]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case errors = "errors"
    }

}
