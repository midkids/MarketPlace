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
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var sellerNameButton: UIButton!
    
    var currentProductIndex: Int = 0
    var currentSellerName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        sellerNameButton.layer.cornerRadius = 15
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
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "productToProfileSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "productToProfileSegue" {
            let destinationViewController = segue.destination as? ProfileViewController
            destinationViewController?.currentSellerName = currentSellerName
        }
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
