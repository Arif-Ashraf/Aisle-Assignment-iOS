//
//  PhoneAuthView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 15/02/23.
//

import SwiftUI

struct PhoneAuthView: View {
    
    //MARK: - Wrapped Properties
    
    @State var countryCode: String = "+91"
    @State var phoneNumber: String = ""
    @State var isActive: Bool = true
    
    @ObservedObject var authVM = LoginAuthViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Get OTP")
                .frame(width: 73, height: 22, alignment: .leading)
                .font(.custom("Inter-Medium", size: 18))
            
            VStack(alignment: .leading) {
                Text("Enter Your")
                Text("Phone Number")
            }
            .font(.custom("Inter-ExtraBold", size: 30))
            .frame(width: 220, height: 72, alignment: .topLeading)
            
            
            HStack {
                TextField("+91", text: $countryCode)
                    .frame(width: 64, height: 36, alignment: .leading)
                    .multilineTextAlignment(.center)
                    .font(.custom("Inter-Bold", size: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 196/255, green: 196/255, blue: 196/255, opacity: 1), lineWidth: 1)
                    )
                
                TextField("Phone Number", text: $phoneNumber)
                    .frame(width: 147, height: 36, alignment: .leading)
                    .multilineTextAlignment(.center)
                    .font(.custom("Inter-Bold", size: 18))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(red: 196/255, green: 196/255, blue: 196/255, opacity: 1), lineWidth: 1)
                    )
            }
            
             
            Button(action: {
                DispatchQueue.main.async {
                    authVM.requestLogin(phoneNo: "\(countryCode)\(phoneNumber)")
                }
            }) {
                Text("Continue")
                    .foregroundColor(.black)
                    .frame(width: 63, height: 17)
                    .font(.custom("Inter-Bold", size: 14))
            }
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .fill(Color.yellow)
                    .frame(width: 96, height: 40)
            )
            .frame(width: 90, height: 40, alignment: .center)
            .padding(.top,10)
            
            
            if(authVM.phoneStatusResponse != nil && authVM.phoneStatusResponse?.status ?? false) {
                NavigationLink(destination: OTPAuthView(phoneNo: "+91\(phoneNumber)")
                    .onAppear(perform: {
                        if let phoneNoStatus = authVM.phoneStatusResponse?.status {
                            debugPrint("Status: \(phoneNoStatus)")
                        }
                    }),
                               isActive: $isActive) {
                }.navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        .padding(.top, 80)
        .padding(.leading,30)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct LoginAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PhoneAuthView()
        }
    }
}
