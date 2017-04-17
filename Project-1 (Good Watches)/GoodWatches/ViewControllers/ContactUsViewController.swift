//
//  ContactUsViewController.swift
//  GoodWatches
//
//  Created by Parth Bhatt on 17/04/17.
//  Copyright © 2017 parthbhatt. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Contact Us"
        self.navigationController?.navigationBar.barTintColor = themeColor;
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        self.tabBarController?.tabBar.barTintColor = UIColor.white
        self.tabBarController?.tabBar.tintColor = themeColor
        
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
