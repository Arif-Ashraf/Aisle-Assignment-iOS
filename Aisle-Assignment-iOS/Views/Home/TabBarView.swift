//
//  HomeView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 1
    @State var token: String = ""
    
    @ObservedObject var notesVM = NotesViewModel()
    
    init(token: String = "") {
        self.token = token
        UITabBar.appearance().backgroundColor = UIColor(Color.white)
        UITabBarItem.appearance().badgeColor =  UIColor(red: 140/255, green: 92/255, blue: 251/255, alpha: 1)
        
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
    
            Text("Discover")
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Discover")
                }
                .tag(0)
            
            NotesView()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Notes")
                }
                .badge(9)
                .tag(1)
            
            Text("Matches")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Matches")
                }
                .badge("50+")
                .tag(2)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
        .onAppear {
                notesVM.getNotes(token: token)
        }
        .navigationBarHidden(true)
        .tint(.black)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabBarView()
        }
    }
}
