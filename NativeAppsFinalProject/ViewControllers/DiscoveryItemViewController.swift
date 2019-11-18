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
        self.SnackButton.imageView?.layer.cornerRadius = 30;
        self.DrinksButton.imageView?.layer.cornerRadius = 30;
        self.GamesButton.imageView?.layer.cornerRadius = 30;
        
     

        // Do any additional setup after loading the view.
    }
    

    @IBAction func snacksButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "snackstable", sender: self);
    }
   
   
    
    @IBAction func drinksButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "drinkstable", sender: self); 
    }
    
    @IBAction func gamesButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "gamestable", sender: self)
    }
    
}
