//
//  DataService.swift
//  recipe list app
//
//  Created by Maxim Ugolnik on 26.10.21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
                
        guard pathString != nil else {
            return [Recipe]()
        }
                    
        let url = URL(fileURLWithPath: pathString!)
                
        do {
            
            let data = try Data(contentsOf: url)
                    
            let decoder = JSONDecoder()
                    
            do {
                
                let recipesList = try decoder.decode([Recipe].self, from: data)
                
                for r in recipesList {
                
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
            
            return recipesList
            
            } catch { print(error) }
        
        } catch { print(error) }
        
        return [Recipe]()
        
    }
}
