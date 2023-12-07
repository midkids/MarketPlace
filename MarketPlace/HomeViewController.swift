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
    
    let listings : [Listing]? = nil
    let chosenListing : Listing? = nil
    let currentUser : User? = nil
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    @IBAction func printAllListings() {
        do {
            let request = Listing.fetchRequest() as NSFetchRequest<Listing>
            let listings = try context.fetch(request)
            
            for listing in listings {
                print(listing.productTitle ?? "no title")
                print(listing.productDescription ?? "no description")
                if let seller = listing.soldBy {
                    print(seller.username ?? "no seller user name")
                } else {
                    print("no seller")
                }
            }
        } catch {
            print("error fetching listings")
        }
    }

    //segues
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
            if let sellerViewController = segue.destination as? SellerViewController{
            }
        }
        
        if segue.identifier == "homeToSearchResultSegue" {
            if let searchResultController = segue.destination as? SearchResultViewController {
                
            }
        }
        
        if segue.identifier == "homeToProductSegue" {
            if let productViewController = segue.destination as? ProductViewController {
                productViewController.listing = chosenListing
            }
        }
        
        if segue.identifier == "homeToProfileSegue" {
            if let profileViewController = segue.destination as? ProfileViewController {
                profileViewController.user = currentUser
            }
            
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
