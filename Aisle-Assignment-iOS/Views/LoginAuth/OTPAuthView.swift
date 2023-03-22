//
//  OTPAuthView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import SwiftUI

struct OTPAuthView: View {
    
    //MARK: - Wrapped Properties
    
    @State var otp: String = ""
    @State var isActive: Bool = true
    @State var phoneNo: String = "+91 999999999"
    @State var countdown = 60
    
    //MARK: - LoginAuthViewModel Instance
    
    @ObservedObject var authVM = LoginAuthViewModel()
    
    @State var auth_token = ""
    
    var body: some View {
        
        //MARK: - View Body
        
        VStack(alignment: .leading) {
            HStack(spacing: -8) {
                TextField("+91 \(phoneNo)", text: $phoneNo)
                    .frame(width: 152, height: 22, alignment: .leading)
                    .font(.custom("Inter-Medium", size: 18))
                
                Image(systemName: "pencil")
                    .frame(width: 11.71, height: 11.71, alignment: .leading)
            }
            
            VStack(alignment: .leading) {
                Text("Enter The")
                Text("OTP")
            }
            .font(.custom("Inter-ExtraBold", size: 30))
            .frame(width: 144, height: 72, alignment: .topLeading)
            
            
            TextField("", text: $otp)
                .frame(width: 78, height: 36, alignment: .leading)
                .multilineTextAlignment(.center)
                .font(.custom("Inter-Bold", size: 18))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(red: 196/255, green: 196/255, blue: 196/255, opacity: 1), lineWidth: 1)
                )
            
            
            HStack {
                Button(action: {
//                    DispatchQueue.main.async {
                        authVM.authenticateOTP(phoneNo: phoneNo, otp: otp)
//                    }
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
                
                
                
                Text("00:\(countdown)")
                    .frame(width: 50, height: 17, alignment: .center)
                    .font(.custom("Inter-Bold", size: 14))
                    .padding(.top,10)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            if self.countdown == 0 {
                                timer.invalidate()
                            } else {
                                self.countdown -= 1
                            }
                        }
                    }
                
                //Condition to get token response
                
                if authVM.otpStatusResponse != nil && (authVM.otpStatusResponse?.token != nil) {
                    NavigationLink(destination: TabBarView()
                        .navigationBarBackButtonHidden(true)
                        .onAppear(perform: {
                            
                            if let token = authVM.otpStatusResponse?.token {
                                debugPrint("Token: \(token)")
                                NotesViewModel().getNotes(token: token)
                            }
                        }),
                                   isActive: $isActive) {
                    }
                        .navigationBarBackButtonHidden(true)
                    
                    
                }
                
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

//MARK: - Preview

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPAuthView()
    }
}
