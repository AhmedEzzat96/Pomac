//
//  APIManager.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation
import Alamofire

class APIManager {
    // Get Science Stories API
    class func getScienceStories(completion: @escaping (Result<ScienceStoryResponse, Error>) -> Void) {
        request(APIRouter.getScienceStories) { response in
            completion(response)
        }
    }
}

extension APIManager {
    // MARK: The request function to get results in a closure
    private static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion:  @escaping (Result<T, Error>) -> ()) {
        // Trigger the HttpRequest using AlamoFire
        AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        .responseJSON { response in
            switch response.result {
                
            case .failure(let error):
                completion(.failure(error))
            default:
                return
            }
            print(response)
        }
    }
}
