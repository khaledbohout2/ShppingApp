//
//  DetailViewController.swift
//  ShppingApp
//
//  Created by Khaled Bohout on 7/27/19.
//  Copyright © 2019 Khaled Bohout. All rights reserved.
//

import UIKit
import moltin

class DetailViewController: UIViewController {
    
    let moltin = Moltin(withClientID: "DKHORJjHyDVDW7gcqrzG4akofcauladw1jCTTTIxMW")
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            
             let productTitle = detail.name
             TitleLabel?.text = productTitle
            
            
             let productDescription = detail.description
             detailDescriptionLabel?.text = productDescription
            
            
            if let productPrice = detail.price?[0].amount {
             priceLabel?.text = String(productPrice)
            }
            

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Product? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    @IBAction func addToCartClicked(_ sender: UIButton) {
        
        //get the current product id
        
        let productID = detailItem?.id
        
        if let id = productID {
            //add the product to the cart
            moltin.cart.addProduct(withID: id, ofQuantity: 1, toCart: "mycart") { (cartItem) in
                
                print(cartItem)
                
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title: "Added To Cart", message: "successfully Added Item To Cart", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }

             
            }
            

        }
        
        
        
        // dispaly mssage that tell the user that the item has added to the cart
    }
    

}

