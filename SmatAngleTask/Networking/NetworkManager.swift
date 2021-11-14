//
//  NetworkManager.swift
//  Pizza Station
//
//  Created by Shadi Elattar on 11/5/21.
//

import Foundation
import Alamofire


class NetworkCLient{
    
    func performRequest<T: Decodable>(_ object: T.Type, router: APIRouter, completion: @escaping ((Result<T,Error>) -> Void)){

        AF.request(router).responseJSON { response in
 
            do{
                let models = try JSONDecoder().decode(T.self, from: response.data!)
                completion(.success(models))
            }catch let error {
                completion(.failure(error))
            }
        }
    }
}
