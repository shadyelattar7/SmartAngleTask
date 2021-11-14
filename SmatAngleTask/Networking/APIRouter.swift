//
//  APIRouter.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/5/21.
//

import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: Parameters? {get}
    var encoding: ParameterEncoding {get}
}

extension APIRouter{
    func asURLRequest() throws -> URLRequest {
        guard var url = URL(string: NetworkConstants.baseUrl) else {
            fatalError("ERROR IN BASE URL")
        }
        url.appendPathComponent(path)
        let endUrl = NetworkConstants.baseUrl + path
        print("URL: \(endUrl)")
        let request = try URLRequest(url: endUrl, method: method, headers: nil)
        return try encoding.encode(request,with: parameters)
    }
}
