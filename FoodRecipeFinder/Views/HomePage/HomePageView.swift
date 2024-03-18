//
//  ContentView.swift
//  FoodRecipeFinder
//
//  Created by Roman Krusman on 17.03.2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText = ""
    private var cuisines: [Category] = [
        Category(name: "Burger", imageName: "burger"),
        Category(name: "Pizza", imageName: "pizza"),
        Category(name: "Sushi", imageName: "sushi"),
        Category(name: "Salad", imageName: "tortilla"),
        Category(name: "Pelmeni", imageName: "pelmen"),
        Category(name: "Sandwich", imageName: "macaroon")
    ]
    private var cards: [RecipePreviewModel] = [
        RecipePreviewModel(name: "Pork + Kale Quinoa Salad", imageName: "salad", description: "This Asian Pork Salad recipe is made with glazed slices of pork tenderloin atop a colorful salad loaded with crunchy vegetables and quinoa. It’s a super flavorful dish to enjoy for lunch or dinner.", time: "15"),
        RecipePreviewModel(name: "Homemade Pepperoni Pizza", imageName: "pizza_img", description: "This pepperoni pizza recipe produces a quick and easy classic! Delicious homemade pizza crust and tomato sauce have never been easier.", time: "25"),
        RecipePreviewModel(name: "Sushi", imageName: "sushi", description: "", time: "20"),
        RecipePreviewModel(name: "Salad", imageName: "tortilla", description: "", time: "15"),
        RecipePreviewModel(name: "Pelmeni", imageName: "pelmen", description: "", time: "40"),
        RecipePreviewModel(name: "Sandwich", imageName: "macaroon", description: "", time: "5")
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    ScrollView(.horizontal, showsIndicators: false) {
                        DishView(cuisines: cuisines)
                    }
                    .safeAreaPadding([.top, .horizontal])
                    
                    HStack {
                        Text("This Week's Favourites")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: EmptyView()) {
                            Text("See All")
                                .fontWeight(.semibold)
                        }
                    }
                    .safeAreaPadding(.horizontal)
                    
                    .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        RecipePreviewView(cards: cards)
                    }
                    .safeAreaPadding()
                    
                    
                }
            }
            .navigationTitle("Apps")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")
        }
    }
}

#Preview {
    BottomNavigationView()
}
