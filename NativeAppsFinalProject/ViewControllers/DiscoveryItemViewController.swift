//
//  DiscoveryItemViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class DiscoveryItemViewController: UIViewController {

    @IBOutlet weak var SnackButton: UIButton!
    @IBOutlet weak var DrinksButton: UIButton!
    @IBOutlet weak var GamesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
    

    @IBAction func snacksButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "snackstable", sender: self);
    }
   
 
    

}
