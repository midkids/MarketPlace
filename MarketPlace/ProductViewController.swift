//
//  ProductViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet var productImageImage: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productPriceLabel: UILabel!
    @IBOutlet var productDescriptionLabel: UILabel!
    @IBOutlet var sellerNameButton: UIButton!
    
    var currentProductIndex: Int
    
    init?(coder: NSCoder, currentProductIndex: Int) {
        self.currentProductIndex = currentProductIndex
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        let currentProduct = products[currentProductIndex]
        let currentSeller = currentProduct.productSeller
        productImageImage.image = currentProduct.productImage
        productNameLabel.text = currentProduct.productName
        productPriceLabel.text = "$" + String(currentProduct.productPrice)
        productDescriptionLabel.text = currentProduct.productDescription
        sellerNameButton.setTitle(currentSeller.sellerName, for: .normal)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
