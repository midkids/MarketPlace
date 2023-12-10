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
        guard let userName = loginUserName.text else { return }
            loggedInUserName = userName
        guard loggedInUserName != "" else {
            loginUserName.text = "Please enter Username"
            return
        }
        guard loggedInUserName != "Please enter Username" else {
            loginUserName.text = "Please enter valid Username"
            return
        }
        performSegue(withIdentifier: "loginToNavigationSegue", sender: self)
    }
}

