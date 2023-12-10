//
//  ViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/26/23.
//

import UIKit

class MarketPlaceViewController: UIViewController {

    @IBOutlet var loginUserName: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let userName = loginUserName.text {
            loggedInUserName = userName
            performSegue(withIdentifier: "loginToNavigationSegue", sender: self)
        }
    }
}

