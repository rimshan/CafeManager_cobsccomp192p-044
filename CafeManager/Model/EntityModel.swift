//
//  EntityModel.swift
//  CafeManager
//
//  Created by Rimshan on 4/29/21.
//  Copyright © 2021 Rimshan. All rights reserved.
//

import Foundation


struct Category{
    var categoryName: String
}

struct User{
    var userName : String
    var userEmail: String
    var userPassword: String
    var userPhone: String
    
}

struct FoodItem {
    var id: String
    var foodName : String
    var foodDescription: String
    var foodPrice : Double
    var discount: Int
    var image: String
    var category: String
}
