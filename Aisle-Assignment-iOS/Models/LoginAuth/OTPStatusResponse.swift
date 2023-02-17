//
//  OTPStatusModel.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import Foundation

struct OTPStatusResponse: Codable {
    
    //MARK: - Properties
    
    let token: String?
    
    //MARK: - Enum
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let results = try decoder.container(keyedBy: CodingKeys.self)
        token = try results.decodeIfPresent(String.self, forKey: .token)
    }
    
    
}
