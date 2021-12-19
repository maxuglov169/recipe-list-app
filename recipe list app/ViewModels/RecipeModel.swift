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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var nominator = ingredient.num ?? 1
        var denominator = ingredient.denum ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // Get a single serving size
            denominator *= recipeServings
            
            // Get target portion
            nominator *= targetServings
            
            // Reduce fraction by common denominator
            let divisor = Rational.greatestCommonDivisor(nominator, denominator)
            nominator /= divisor
            denominator /= divisor
            
            // Get whole portions if nominator > denominator
            if nominator >= denominator {
                wholePortions = nominator / denominator
                nominator %= denominator
                portion += String(wholePortions)
            }
            
            // Express remainder as a fraction
            if nominator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(nominator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                //Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denum == nil ? "" : " "
            return portion + unit
        }
        
        return portion
        
    }
    
}
