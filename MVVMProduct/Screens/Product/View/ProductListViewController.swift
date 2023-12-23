//
//  ProductListViewController.swift
//  MVVMProduct
//
//  Created by pnkbksh on 24/12/23.
//

import UIKit

class ProductListViewController: UIViewController {

    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }

}


extension ProductListViewController{
    func configuration(){
        self.initViewModel()
        self.observeEvent()
    }
    
    func initViewModel(){
        self.viewModel.productFeatch()
    }
    
    
    //for data binding
    func observeEvent(){
        self.viewModel.eventHandler = { [weak self]  event in
            guard let self = self else { return  }
            
            switch event {
            case .loading:break //can show indicator
            case .stopLoading:break //can  hide Indicator 
                
            case .dataLoading:
                print(self.viewModel.products)
                
            case .error(let error):
                print(error)
                
            default:
                print("")
            }
        }
    }
}
