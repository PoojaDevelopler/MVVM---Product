//
//  ProductViewModel.swift
//  MVVMProduct
//
//  Created by pnkbksh on 24/12/23.
//

import Foundation

final class ProductViewModel{
    
    var products :[ProductModel] = []
    var eventHandler:((_ event:Event)->Void)? // clousure for data binding
    
    func productFeatch(){
        self.eventHandler?(.loading)
        APIManger.shared.fetchProduct { response in
            self.eventHandler?(.stopLoading)
            switch response{
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoading)
            case .failure(let error):
                print(error)
                self.eventHandler?(.error(error))
            }
        
        }
    }
}


extension ProductViewModel{
    enum Event{
        case loading
        case stopLoading
        case dataLoading
        case error(Error?)
        
    }
}
