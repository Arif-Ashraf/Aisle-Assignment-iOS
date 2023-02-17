//
//  NotesViewModel.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 17/02/23.
//

import Foundation

class NotesViewModel: ObservableObject {
    
    func getNotes(token: String) {
        APIManager.shared.getRequest(Service.base_url + Service.notes_url, headers: ["Authorization" : "Bearer \(token)"]) { response in
            debugPrint("Response: \(response)")
        } failure: { error in
            debugPrint(error)
        }

    }
}
