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
    
    var listing : Listing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = 15
        saveButton.layer.cornerRadius = 15
        sellerNameButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        
        if let currentProduct = listing , let currentSeller = listing?.soldBy {
            productImageImage.image = UIImage( data: currentProduct.image ?? Data() )
            productNameLabel.text = currentProduct.productTitle
            productPriceLabel.text = "$" + String(currentProduct.productPrice)
            productDescriptionLabel.text = currentProduct.description
            sellerNameButton.setTitle(currentSeller.username, for: .normal)
        }
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "productToProfileSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "productToProfileSegue" {
//            let destinationViewController = segue.destination as? ProfileViewController
//            destinationViewController?.currentSellerName = currentSellerName
//        }
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
