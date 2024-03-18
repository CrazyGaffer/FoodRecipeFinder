//
//  BottomNavigationView.swift
//  FoodRecipeFinder
//
//  Created by Roman Krusman on 18.03.2024.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FavouritesView()
                .tabItem {
                    Label("Favoutites", systemImage: "suit.heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}
