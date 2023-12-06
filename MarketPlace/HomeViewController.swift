//
//  HomeViewController.swift
//  MarketPlace
//
//  Created by Myron Snelson on 11/29/23.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    
    var currentProductIndex = 6
    var currentProductName = ""
    var currentSellerName = ""
    var currentUserName = "elf101"
    
    
    var listings : [Listing]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func fetchListings() {
        do {
            self.listings = try context.fetch(Listing.fetchRequest())
            print(self.listings ?? "There are no listings")
        } catch {
            print("there was an error")
        }
    }
    
    @IBAction func addUser() {
        let newUser = User(context: self.context)
        newUser.username = "alphabetsoup"
        newUser.password = "butitsallos"
        newUser.rating = 4
        
        do {
            try self.context.save()
            print("user added")
        } catch {
            print("there was an error saving the user")
        }
    }
    
    func deleteUser(){
        //self.context.delete(User)
        //self.context.save
    }
    func updateUser(){
        // make edit to a user object
        // self.context.save()
    }
    
    
    @IBAction func addListing() {
        let newListing = Listing(context: self.context)
        newListing.isSold = false
        newListing.productDescription = "These are the best running shoes"
        newListing.productPrice = 45.00
        newListing.productTitle = "Running Shoes"
        
        do{
            try self.context.save()
            print("Listing added")
        } catch {
            print("there was an error saving the listing")
        }
    }
    
    @IBAction func printAllUsers() {
        print("starting printAllUsers")
        do{

            let request = User.fetchRequest() as NSFetchRequest<User>
            let sort = NSSortDescriptor(key: "username", ascending: true)
            request.sortDescriptors = [ sort ]

            let allUsers = try context.fetch(request)

            for user in allUsers {
                print(user.username ?? "username is nil")
            }
        } catch {
            print("There was an error fetching all users")
        }

    }
    
    @IBAction func printfilteredUsers() {
        do {
            let request = User.fetchRequest() as NSFetchRequest<User>
            let predicate = NSPredicate(format: "password CONTAINS %@", "pass")
            request.predicate = predicate
            
            let users = try context.fetch(request)
            
            for user in users {
                print(user.username!)
                print(user.password!)
            }
        } catch {
            print("error doing filtered fetch")
        }
        
    }

    @IBAction func sellerButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToSellerSegue", sender: self)
    }
    
    @IBAction func productButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToProductSegue", sender: self)
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToSearchResultSegue", sender: self)
    }
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "homeToProfileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToSellerSegue" {
            let destinationViewController = segue.destination as? SellerViewController
            destinationViewController?.currentSellerName = currentSellerName
        }
        if segue.identifier == "homeToSearchResultSegue" {
            let destinationViewController = segue.destination as? SearchResultViewController
            destinationViewController?.currentProductName = currentProductName
        }
        if segue.identifier == "homeToProductSegue" {
            let destinationViewController = segue.destination as? ProductViewController
            destinationViewController?.currentProductIndex = currentProductIndex
            destinationViewController?.currentUserName = currentUserName
        }
        if segue.identifier == "homeToProfileSegue" {
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
