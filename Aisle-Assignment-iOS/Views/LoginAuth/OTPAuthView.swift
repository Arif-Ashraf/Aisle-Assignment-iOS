//
//  OTPAuthView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import SwiftUI

struct OTPAuthView: View {
    
    @State var otp: String = ""
    @State var isActive: Bool = true
    @State var phoneNo: String = "+91 999999999"
    @State var countdown = 60
    
    @ObservedObject var authVM = LoginAuthViewModel()
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: -8) {
                TextField("+91 \(phoneNo)", text: $phoneNo)
                    .frame(width: 152, height: 22, alignment: .leading)
                    .font(.system(size: 18, weight: .regular))
                
                Image(systemName: "pencil")
                    .frame(width: 11.71, height: 11.71, alignment: .leading)
            }
            
            VStack(alignment: .leading) {
                Text("Enter The")
                Text("OTP")
            }
            .font(.system(size: 30, weight: .heavy))
            .frame(width: 144, height: 72, alignment: .topLeading)
            
            
            TextField("", text: $otp)
                .frame(width: 78, height: 36, alignment: .leading)
                .multilineTextAlignment(.center)
                .font(
                    .system(size: 18, weight: .bold, design: .default)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(red: 196/255, green: 196/255, blue: 196/255, opacity: 1), lineWidth: 1)
                )
            
            
            HStack {
                Button(action: {
                    DispatchQueue.main.async {
                        authVM.authenticateOTP(phoneNo: phoneNo, otp: otp)
                    }
                }) {
                    Text("Continue")
                        .foregroundColor(.black)
                        .frame(width: 63, height: 17)
                        .font(.system(size: 14, weight: .bold, design: .default))
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
                    .font(.system(size: 14, weight: .bold))
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
                
                
                if authVM.otpStatusResponse != nil && (authVM.otpStatusResponse?.token != nil) {
                    NavigationLink(destination: TabBarView(token: authVM.otpStatusResponse?.token ?? "")
                        .navigationBarBackButtonHidden(true)
                        .onAppear(perform: {
                            if let token = authVM.otpStatusResponse?.token {
                                debugPrint("Token: \(token)")
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

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPAuthView()
    }
}
