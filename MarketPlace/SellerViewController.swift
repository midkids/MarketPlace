//
//  SellerViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit

class SellerViewController: UIViewController {

    var currentUserName = ""
    var currentProductIndex = 0
    
    var currentProductID = 0
    var currentProductImage = UIImage(imageLiteralResourceName: "iphone15.jpg")
    var currentProductName = ""
    var currentPriceString = ""
    var currentProductPrice = 0
    var currentProductDescription = ""
    
    @IBOutlet var sellerAddButton: UIButton!
    @IBOutlet var sellerUserName: UILabel!
    @IBOutlet var sellerProductName: UITextField!
    @IBOutlet var sellerPrice: UITextField!
    @IBOutlet var sellerDescription: UITextView!
    @IBOutlet var sellerImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sellerUserName.text = currentUserName
        sellerAddButton.layer.cornerRadius = 15
        sellerImage.image = currentProductImage
        // Do any additional setup after loading the view.
    }
    
    @IBAction func productButtonPressed(_ sender: UIButton) {
//        currentProductImage = UIImage(imageLiteralResourceName: "macbookpro.jpg")
        if let optionalImage = sellerImage.image {
            currentProductImage = optionalImage
        } else {
            print("User did not provide image")
        }
//        currentProductName = "MacBook Pro"
        if let optionalProductName = sellerProductName.text {
            currentProductName = optionalProductName
        } else {
            print("User did not provide product name")
        }
        print(currentProductName)
//        currentProductPrice = 300
        if let optionalPriceString = sellerPrice.text {
            currentPriceString = optionalPriceString
        } else {
            print("User did not enter price")
        }
        if let optionalPrice = Int(currentPriceString) {
            currentProductPrice = optionalPrice
        } else {
            print("User entered non-integer price")
        }
//        currentProductDescription = "2019 MacBook Pro. Intel I5, 8GB RAM, 256GB drive."
        if let optionalProductDescription = sellerDescription.text {
            currentProductDescription = optionalProductDescription
        } else {
            print("User did not provide description")
        }
            
        let currentProduct = Product(productID: currentProductID, productImage: currentProductImage, productName: currentProductName, productPrice: currentProductPrice, productDescription: currentProductDescription, productUserName: currentUserName)
        products.append(currentProduct)
        sellerProductName.text = "Added!"
        sellerPrice.text = ""
        sellerDescription.text = ""
        sellerImage.image = nil
        
        currentProductIndex = products.count - 1
        performSegue(withIdentifier: "sellerToProductSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sellerToProductSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductIndex = currentProductIndex
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
