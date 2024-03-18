//
//  RecipePreviewView.swift
//  FoodRecipeFinder
//
//  Created by Roman Krusman on 17.03.2024.
//

import SwiftUI

struct RecipePreviewView: View {
    @State private var addeToFav = false
    var cards: [RecipePreviewModel]
    var body: some View {
        HStack(spacing: 15) {
            ForEach(cards) { card in
                VStack {
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 80, height: 200)
                        .clipped()
                        .overlay(Color.black.opacity(0.4))
                    
                    VStack(alignment: .leading) {
                        Text(card.name)
                            .lineLimit(1, reservesSpace: true)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        Text(card.description)
                            .lineLimit(1, reservesSpace: true)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 5)
                        HStack {
                            Image(systemName: "clock")
                                .foregroundColor(.secondary)
                            Text("\(card.time) min")
                                .foregroundColor(.secondary)
                            Rectangle()
                                .frame(width: 1, height: 15)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 5)
                            Image(systemName: "person")
                                .foregroundColor(.secondary)
                            Text("Serves 1")
                                .foregroundColor(.secondary)
                        }
                        .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width - 80)
                .overlay(alignment: .topTrailing, content: {
                    Button {
                        withAnimation {
                            addeToFav.toggle()
                        }
                    }label: {
                        Image(systemName: addeToFav ? "suit.heart.fill" : "suit.heart")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(10)
                    }
                    .sensoryFeedback(.success, trigger: addeToFav)
                })
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .shadow(radius: 5)
            }
        }
    }
}

#Preview {
    HomePageView()
}


struct RecipePreviewModel: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
    var time: String
}
