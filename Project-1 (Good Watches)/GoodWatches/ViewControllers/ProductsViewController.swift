//
//  ProductsViewController.swift
//  GoodAsOldPhones
//
//  Created by Parth Bhatt on 17/04/17.
//  Copyright © 2017 parthbhatt. All rights reserved.
//

import UIKit

let themeColor = UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)


class ProductsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var tblProducts: UITableView!
    
    fileprivate let productIdentifier = "productTableViewCell"
    
    var arrProducts: [Product<NSObject>]?
    
    var arrIndex:NSMutableArray = []
    
    //MARK: - View Life cycle methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Array of Products to be displayed
        arrProducts = [Product(name: "Hublot", imageName: "hublot-logo", fullImageName: "hublot_watch"),
                       Product(name: "Rolex", imageName: "rolex-logo", fullImageName: "rolex_watch"),
                       Product(name: "Omega", imageName: "omega-logo", fullImageName: "omega_watch")];
        
        
        // Added index array to avoid animation of imageview every time while scrolling.
        if let prodArray = arrProducts {
            for item in prodArray {
                print(item)
                arrIndex.add(0)
            }
        }
        
        //Added title to top bar along with the bar tint color and title text attributes
        self.navigationItem.title = "Watches"
        self.navigationController?.navigationBar.barTintColor = themeColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //Added bar tint color and title & image tint color to bottom bar
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = themeColor
        
        //Reload table view.
        tblProducts.dataSource = self
        tblProducts.delegate = self
        tblProducts.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table View Datasource and Delegates
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
        
        //Assigning product information to cell.
        cell.textLabel?.text = product?.name
        if let imageName = product?.imageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        
        animateImageIfNeeded(forCell: cell, atIndex: indexPath)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60;
    }
    
    //MARK: - Custom Metods
    
    //This method is used to animate the image the first time a cell is created at a particular indexPath
    func animateImageIfNeeded(forCell cell: UITableViewCell, atIndex indexPath: IndexPath)
    {
        //Checks if cell is created for the first time at a given indexPath
        if((arrIndex[indexPath.row] as? Int) == 0)
        {
            cell.imageView?.transform = CGAffineTransform(scaleX: 0, y: 0);
            UIView.animate(withDuration: 2, animations: {
                cell.imageView?.transform = CGAffineTransform.identity
            })
            arrIndex.replaceObject(at:indexPath.row, with: 1);
        }
    }    
}
