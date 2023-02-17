//
//  LoginAuthViewModel.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 15/02/23.
//

import Foundation

class LoginAuthViewModel: ObservableObject {
    
    @Published var phoneStatusResponse: PhoneNoStatusResponse?
    @Published var otpStatusResponse: OTPStatusResponse?
    
    func requestLogin(phoneNo: String) {
        
        APIManager.shared.postRequest(url: Service.base_url + Service.phone_number_login_url,
                                      params: ["number": phoneNo]) { response in
            do {
                let results = try JSONDecoder().decode(PhoneNoStatusResponse.self, from: response)
                DispatchQueue.main.async {
                    self.phoneStatusResponse = results
                }
            } catch {
                print("Decoding error: ", error)
            }
            
        } failure: { error in
            print("Response Error: ", error)
        }
        
    }
    
    func authenticateOTP(phoneNo: String, otp: String) {
        
        APIManager.shared.postRequest(url: Service.base_url + Service.verify_otp_url, params: ["number": phoneNo, "otp": otp]) { response in
            do {
                let results = try JSONDecoder().decode(OTPStatusResponse.self, from: response)
                DispatchQueue.main.async {
                    self.otpStatusResponse = results
                }
            } catch {
                debugPrint("Decoding Error: ", error.localizedDescription)
            }
        } failure: { error in
            print("Response Error: ", error)
        }

    }
    
    
}
