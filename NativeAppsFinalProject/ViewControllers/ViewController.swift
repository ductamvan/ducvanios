//
//  ViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var singUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //github connection test.
        print("github connect success");
        setUpElements();
      
     
    }
    
    //elements plaatsen en bewereken
    func setUpElements(){
        loginButton.layer.cornerRadius = 50;
        singUpButton.layer.cornerRadius = 50;
        
    }
    
    


}

