//
//  HomeView.swift
//  Aisle-Assignment-iOS
//
//  Created by arifashraf on 16/02/23.
//

import SwiftUI

struct TabBarView: View {
    
    //MARK: - Wrapped Properties
    
    @State private var selectedTab = 1
    
    //MARK: - Notes View Model Instance
    
    @ObservedObject var notesVM = NotesViewModel()
    
    init() {
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
        .navigationBarHidden(true)
        .tint(.black)
        
    }
}

//MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TabBarView()
        }
    }
}
