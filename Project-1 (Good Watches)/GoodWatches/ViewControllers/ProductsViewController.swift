//
//  ProductsViewController.swift
//  GoodAsOldPhones
//
//  Created by Parth Bhatt on 17/04/17.
//  Copyright © 2017 parthbhatt. All rights reserved.
//

import UIKit

let themeColor = UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)


class ProductsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblProducts: UITableView!
    
    fileprivate let productIdentifier = "productTableViewCell"
    
    var arrProducts: [Product<NSObject>]?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         arrProducts = [Product(name: "Hublot", imageName: "hublot-logo", fullImageName: "hublot_watch"),Product(name: "Rolex", imageName: "rolex-logo", fullImageName: "rolex_watch"),Product(name: "Omega", imageName: "omega-logo", fullImageName: "omega_watch")];
        
        self.navigationItem.title = "Watches"
        self.navigationController?.navigationBar.barTintColor = themeColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = themeColor
        
        tblProducts.dataSource = self
        tblProducts.delegate = self
        tblProducts.reloadData()
    }
    
    //MARK: Table View Datasource and Delegates
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let productsArray = arrProducts
        {
            return productsArray.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:productIdentifier, for: indexPath)
        
        let product = arrProducts?[indexPath.row]
        
        //Added code to show end to end separator.
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.textLabel?.text = product?.name
        if let imageName = product?.imageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
