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
        self.SnackButton.layer.cornerRadius = 20;
        self.DrinksButton.layer.cornerRadius = 20;
        self.GamesButton.layer.cornerRadius = 20;
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
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
