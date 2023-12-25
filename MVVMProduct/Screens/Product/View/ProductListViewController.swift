//
//  ProductListViewController.swift
//  MVVMProduct
//
//  Created by pnkbksh on 24/12/23.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productTV:UITableView!{
        didSet{
            productTV.dataSource = self
            productTV.delegate = self
        }
    }
    
    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }

}


extension ProductListViewController{
    func configuration(){
        productTV.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
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
                DispatchQueue.main.async{
                    //UI update
                    self.productTV.reloadData()
                }
                
            case .error(let error):
                print(error ?? "...")
                
            }
        }
    }
}

extension ProductListViewController:UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        cell.product = self.viewModel.products[indexPath.row]
        return cell
    }
    
    
    
}
