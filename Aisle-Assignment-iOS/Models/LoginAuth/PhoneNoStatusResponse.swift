//
//  PhoneStatusModel.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import Foundation

struct PhoneNoStatusResponse: Codable {
    
    //MARK: - Properties
    
    var status: Bool
    
    
    //MARK: - Enum
    
    enum CodingKeys: String, CodingKey {
        case status
    }
    
    init(from decoder: Decoder) throws {
        let results = try decoder.container(keyedBy: CodingKeys.self)
        status = try results.decode(Bool.self, forKey: .status)

    }
    
}
