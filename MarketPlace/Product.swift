//
//  Product.swift
//  MarketPlace
//
//  Created by Myron Snelson on 12/2/23.
//

import Foundation
import UIKit

struct Product {
    var productID: Int
    var productImage: UIImage
    var productName: String
    var productPrice: Int
    var productDescription: String
    var productUserName: String
}

var products: [Product] = [
    Product(productID: 1, productImage: UIImage(imageLiteralResourceName: "macbookpro.jpg"), productName: "MacBook Pro", productPrice: 500, productDescription: "2019 MacBook Pro. Intel I5, 8GB RAM, 256GB drive. ", productUserName: "santaclaus349"),
    Product(productID: 2, productImage: UIImage(imageLiteralResourceName: "boots.jpg"), productName: "Women's boots", productPrice: 50, productDescription: "Gently used Ugg boots, size 9.", productUserName: "santaclaus349"),
    Product(productID: 3, productImage: UIImage(imageLiteralResourceName: "jacket.jpg"), productName: "Women's jacket", productPrice: 45, productDescription: "Brand new Amazon Essential lightweight jacket. Color black, size small. Received as gift. Waited too long to send back.", productUserName: "rudolph27"),
    Product(productID: 4, productImage: UIImage(imageLiteralResourceName: "googlenesthub.jpg"), productName: "Google Nest Hub", productPrice: 60, productDescription: "Second generation. 7 inch display, chalk color. Plays videos and music. Use to control smart devices in your home.", productUserName: "rudolph27"),
    Product(productID: 5, productImage: UIImage(imageLiteralResourceName: "printer.jpg"), productName: "HP printer", productPrice: 70, productDescription: "HP Deskjet model 2755 inkjet printer and scanner. Can be set up to work wirelessly.", productUserName: "rudolph27"),
    Product(productID: 6, productImage: UIImage(imageLiteralResourceName: "guitar.jpg"), productName: "Fender acoustic guitar", productPrice: 50, productDescription: "Squier model. Natural finish front, mahogany finish back. Good starter guitar. No nicks or dents. Sold for $100 new.", productUserName: "rudolph27"),
    Product(productID: 7, productImage: UIImage(imageLiteralResourceName: "tablet.jpg"), productName: "Amazon Fire Tablet", productPrice: 35, productDescription: "8 inch HD display. 32 GB memory. Black. Two years old. Minor scratches.", productUserName: "frosty981")
]

struct User {
    var userName: String
    var userPassword: String
}

struct Saved {
    var savedUserName: String
    var savedProducts: [Product]
}
