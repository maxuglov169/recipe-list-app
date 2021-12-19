//
//  ContentView.swift
//  recipe list app
//
//  Created by Maxim Ugolnik on 26.10.21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("All Recipes")
                .bold()
                .font(.largeTitle)
                .padding(.top, 40)
            
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(model.recipes) { r in
                        
                        NavigationLink {
                            RecipeDetailView(recipe: r)
                        } label: {
                            HStack(spacing: 20.0) {
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(10)
                                Text(r.name)
                                    .foregroundColor(.black)
                            }
                        }
                        
                    }.navigationBarHidden(true)
                    
                }
                
            }
        }
        .padding(.leading)
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
