//
//  RecipeModel.swift
//  recipe list app
//
//  Created by Maxim Ugolnik on 26.10.21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //we move json parsing into separate DataService class
        
        self.recipes = DataService.getLocalData()
        
    }
    
}
