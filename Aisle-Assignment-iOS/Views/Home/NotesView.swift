//
//  NotesView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 17/02/23.
//

import SwiftUI

struct NotesView: View {
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(alignment: .center) {
                    
                    
                    Text("Personal messages to you")
                        .frame(width: 215, height: 15)
                        .font(Font.custom("Gilroy-SemiBold", size: 18))
                    
                    ZStack(alignment: .bottomLeading){
                        Image("pic1")
                            .resizable()
                            .frame(width: 370, height: 344)
                            .cornerRadius(15)
                        
                        VStack(alignment:.leading){
                            
                            Text("Meena, 23")
                                .foregroundColor(.white)
                                .font(.custom("Gilroy-ExtraBold", size: 22))
                            
                            Text("Tap to review 50+ notes")
                                .foregroundColor(Color.white)
                                .font(.custom("Gilroy-SemiBold", size: 22))
                            
                        }.padding()
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Interested In You")
                            .frame(width: 330, height: 27, alignment: .leading)
                            .font(.custom("Gilroy-ExtraBold", size: 22))
                        
                        HStack(alignment: .top, spacing: 80) {
                            Text("Premium members can view all their likes at once")
                                .foregroundColor(.gray)
                                .frame(width: 177, height: 91, alignment: .topLeading)
                                .font(.custom("Gilroy-SemiBold", size: 15))
                            
                            Button {
                                
                                print("Upgrade Button")
                                
                            } label: {
                                
                                Text("Upgrade")
                                    .frame(width: 62, height: 23, alignment: .topTrailing)
                                    .font(.custom("Gilroy-ExtraBold", size: 15))
                                    .background(RoundedRectangle(cornerRadius: 24.5)
                                        .fill(Color(red: 252/255, green: 223/255, blue: 3/255))
                                        .frame(width: 113, height: 50))
                                
                            }
                            .tint(.black)
                            
                        }
                        
                    }.padding(.top,5)
                    
                    HStack{
                        
                        ZStack(alignment: .bottomLeading){
                            
                            Image("pic2")
                                .cornerRadius(16).frame(width: 185, height: 255)
                            
                            VStack(alignment:.leading){
                                
                                Text("Teena").font(.custom("Gilroy-SemiBold", size: 18))
                                    .foregroundColor(Color.white)
                                
                            }.padding()
                            
                        }
                        
                        ZStack(alignment: .bottomLeading){
                            
                            Image("pic3")
                                .cornerRadius(16).frame(width: 185, height: 255)
                            
                            VStack(alignment:.leading){
                                
                                Text("Beena").font(.custom("Gilroy-SemiBold", size: 18))
                                    .foregroundColor(Color.white)
                                
                            }.padding()
                            
                        }
                        
                    }.padding(.top,-50)
                    
                }
                .navigationBarHidden(false)
                .navigationTitle("Notes")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .top, content: {})
                
                Spacer()
                
            }
            
        }
        
    }
    
}

//MARK: - Preview

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
