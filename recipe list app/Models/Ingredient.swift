//
//  Ingredient.swift
//  recipe list app
//
//  Created by Maxim Ugolnik on 26.11.21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denum:Int?
    var unit:String?
}
