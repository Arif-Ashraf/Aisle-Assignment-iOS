//
//  APIManager.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    private init(){}
    
    func postRequest(url: String, params: [String: Any], success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        
        AF.request(url, method: .post, parameters: params).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    _ = try JSONSerialization.jsonObject(with: data)
                    success(data)
                } catch {
                    debugPrint("Error: ", error)
                }
            case .failure(let err):
                debugPrint("Error: ", err)
                failure(err)
            }
        }
    }
    
    func getRequest(_ url: String, headers: [String:String], success: @escaping (Data) -> Void, failure: @escaping (Error) -> Void) {
        
        AF.request(url, method: .get, headers: HTTPHeaders.init(headers)).responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    _ = try JSONSerialization.jsonObject(with: data)
                    success(data)
                } catch {
                    debugPrint("Error: ", error)
                }
                
            case .failure(let error):
                debugPrint("Error: ", error)
                failure(error)
            }
        }
    }
}
