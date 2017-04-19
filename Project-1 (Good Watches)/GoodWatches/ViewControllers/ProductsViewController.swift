//
//  ProductsViewController.swift
//  GoodWatches
//
//  Created by Parth Bhatt on 18/04/17.
//  Copyright © 2017 netweb. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViewProducts: UICollectionView!
    var brandName: String?
    var dictionaryProducts = [String:[Product<NSObject>]]() // dictionaryProducts = [String:[Product<NSObject>]]() means NSMutableDictionary *dictionaryProducts = [[NSMutableDictionary alloc] init];
                                                            // dictionaryProducts: [String:[Product<NSObject>]]? means NSMutableDictionary *dictionaryProducts = nil;
    var arrProducts: [Product<NSObject>]?
    var numberOfItemsPerRow = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationItem.title = brandName;
        
        dictionaryProducts = ["Hublot":[Product(modelnumber: "Hub#01", imageName: "hublot1", largeImageName: "hublot1"),
                                        Product(modelnumber: "Hub#02", imageName: "hublot2", largeImageName: "hublot2"),
                                        Product(modelnumber: "Hub#03", imageName: "hublot3", largeImageName: "hublot3"),
                                        Product(modelnumber: "Hub#04", imageName: "hublot4", largeImageName: "hublot4"),
                                        Product(modelnumber: "Hub#01", imageName: "hublot1", largeImageName: "hublot1"),
                                        Product(modelnumber: "Hub#02", imageName: "hublot2", largeImageName: "hublot2"),
                                        Product(modelnumber: "Hub#03", imageName: "hublot3", largeImageName: "hublot3"),
                                        Product(modelnumber: "Hub#04", imageName: "hublot4", largeImageName: "hublot4")],
                              "Rolex":[Product(modelnumber: "Rol#01", imageName: "rolex1", largeImageName: "rolex1"),
                                       Product(modelnumber: "Rol#02", imageName: "rolex2", largeImageName: "rolex2"),
                                       Product(modelnumber: "Rol#03", imageName: "rolex3", largeImageName: "rolex3"),
                                       Product(modelnumber: "Rol#04", imageName: "rolex4", largeImageName: "rolex4")],
                              "Omega":[Product(modelnumber: "Ome#01", imageName: "omega1", largeImageName: "omega1"),
                                       Product(modelnumber: "Ome#02", imageName: "omega2", largeImageName: "omega2"),
                                       Product(modelnumber: "Ome#03", imageName: "omega3", largeImageName: "omega3"),
                                       Product(modelnumber: "Ome#04", imageName: "omega4", largeImageName: "omega4")]];
        
        if let brand = brandName, let arrayValue = dictionaryProducts[brand]  {
            arrProducts = arrayValue;
            print("\nProducts are \(arrayValue)");
        }
        else
        {
            print("values are nil")
        }
        
        collectionViewProducts.delegate = self
        collectionViewProducts.dataSource = self
        collectionViewProducts.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = brandName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - Collection View delegate & Datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let productArray = arrProducts
        {
            return productArray.count;
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        let product = arrProducts?[indexPath.row]
        
        if let newProduct = product, let newImage = product?.imageName
        {
            cell.lblProductModelNumber.text = newProduct.modelnumber;
            cell.imgVProduct.image = UIImage(named: newImage)
        }
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfItemsPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfItemsPerRow))
        return CGSize(width: size, height: size)
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
