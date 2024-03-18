//
//  DishView.swift
//  FoodRecipeFinder
//
//  Created by Roman Krusman on 17.03.2024.
//

import SwiftUI

struct DishView: View {
    var cuisines: [Category]
    let gridRows = [
        GridItem(.adaptive(minimum: 150)),
    ]
    var body: some View {
        LazyHGrid(rows: gridRows, spacing: 15) {
            ForEach(cuisines) { cuisine in
                NavigationLink(destination: EmptyView()) {
                    VStack {
                        Image(cuisine.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                        Text(cuisine.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
