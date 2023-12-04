//
//  Product.swift
//  MarketPlace
//
//  Created by Myron Snelson on 12/2/23.
//

import Foundation
import UIKit

struct Product {
    var productImage: UIImage
    var productName: String
    var productPrice: Int
    var productDescription: String
    var productSeller: Seller
}

struct Seller {
    var sellerName: String
}

var products: [Product] = [
    Product(productImage: UIImage(imageLiteralResourceName: "marketplace.jpg"), productName: "product1", productPrice: 50, productDescription: "This is just a first test description for a test product", productSeller: Seller(sellerName: "John Smith")),
    Product(productImage: UIImage(imageLiteralResourceName: "marketplace.jpg"), productName: "product1", productPrice: 50, productDescription: "This is just a second test description for a test product", productSeller: Seller(sellerName: "John Smith")),
    Product(productImage: UIImage(imageLiteralResourceName: "marketplace.jpg"), productName: "product1", productPrice: 50, productDescription: "This is just a third test description for a test product", productSeller: Seller(sellerName: "John Smith"))
]

var sellers: [Seller] = [
    Seller(sellerName: "John Smith")]
