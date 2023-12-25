//
//  ProductCell.swift
//  MVVMProduct
//
//  Created by pnkbksh on 24/12/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productViewBackGround:UIView!
    @IBOutlet weak var productTitle:UILabel!
    @IBOutlet weak var productCategory:UILabel!
    @IBOutlet weak var productDescription:UILabel!
    @IBOutlet weak var productPrice:UILabel!
    @IBOutlet weak var productRateButton:UIButton!
    @IBOutlet weak var productImage:UIImageView!
    
    var product:ProductModel?{
        didSet{//prperty observer
            productDetailsConfiguaration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfiguaration(){
        guard let product else {
            return
        }
        productTitle.text = product.title
        productCategory.text = product.category
        productDescription.text = product.description
        productPrice.text = "Rs.\(product.price)"
        productRateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImage.setImage(with: product.image)
    }
    
}
