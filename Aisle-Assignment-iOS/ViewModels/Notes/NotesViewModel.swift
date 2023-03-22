//
//  NotesViewModel.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 17/02/23.
//

import Foundation

struct TokenResponse: Codable {
    
    //MARK: - Properties
    
    var token: String?
    
    //MARK: - Enum
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
    init(from decoder: Decoder) throws {
        let results = try decoder.container(keyedBy: CodingKeys.self)
        token = try results.decodeIfPresent(String.self, forKey: .token)
    }
    
    
}

class NotesViewModel: ObservableObject {
    
    @Published var tokenResponse: TokenResponse?
    
    func getNotes(token: String) {
        APIManager.shared.getRequest(Service.base_url + Service.notes_url, headers: ["Authorization" : "Bearer \(token)"]) { response in
            do {
                let results = try JSONDecoder().decode(TokenResponse.self, from: response)
                DispatchQueue.main.async {
                    self.tokenResponse = results
                    
                }
            } catch {
                print("Decoding error: ", error)
            }
            debugPrint("Response: \(response)")
        } failure: { error in
            debugPrint(error)
        }

    }
}
