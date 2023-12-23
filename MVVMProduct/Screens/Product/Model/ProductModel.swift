//
//  ProductModel.swift
//  MVVMProduct
//
//  Created by pnkbksh on 23/12/23.
//

import Foundation

struct ProductModel:Decodable {
    let id: Int
    let title:String
    let price:Float
    let description:String
    let category:String
    let image:String
    let rating:RateModel
    
    
}

struct RateModel:Decodable {
    let rate :Float
    let count:Int
}
