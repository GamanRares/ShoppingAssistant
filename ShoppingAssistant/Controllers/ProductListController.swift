//
//  ProductListController.swift
//  ShoppingAssistant
//
//  Created by Gaman Rares-Constantin on 1/5/20.
//  Copyright © 2020 Gaman Rares-Constantin. All rights reserved.
//

import UIKit

class ProductListController: UITableViewController {
    
    var products: Array<Product> = Array<Product>()
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.setIsLoggedIn(value: false)
        performSegue(withIdentifier: "SignOutFromProductList", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadProducts()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProductTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductTableViewCell else {
            fatalError("The dequeued cell is not an instance of ProductTableViewCell")
        }
        
        let product = products[indexPath.row]
        
        cell.productName.text = product.name
        cell.productImage.image = product.image
        cell.nrOfOffers.text = String(product.offers.count)
        
        return cell
    }
    
    private func loadProducts() {
        products = Array(HighPerformanceButCostlyDatabase.products)
    }
    
}
