//
//  ApiManager.swift
//  MVVMProduct
//
//  Created by pnkbksh on 23/12/23.
//

import UIKit

enum DataError:Error{
    case invalidResposne
    case invalidURL
    case invalidData
    case network(Error?)
    
}

typealias Handler = (Result<[ProductModel] , DataError>) ->Void

//Singletone design Pattern
//capital Singletone use init private no one should create object outside class
//singletone :- objcet can create outside class ()
//Singletone :- Sobject cant crreate outside class just add private  init() {}
//final :- no inheritance of APIManger

final class APIManger{
    static  let shared = APIManger()
    private  init() {}
    
    //result  contain-- success and error
    func fetchProduct(completion:@escaping Handler){
        
        guard let url = URL(string: Constant.API.productURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            guard let  data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse , 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResposne))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([ProductModel].self, from: data)
                //   ProductModel is array
                completion(.success(products))
            } catch{
                completion(.failure(.network(error)))
            }
        }.resume()
    }
}
