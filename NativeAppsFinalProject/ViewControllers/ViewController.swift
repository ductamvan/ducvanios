//
//  ViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var singUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //github connection test.
        print("github connect success");
        setUpElements();
        do {
            try Auth.auth().signOut();
        } catch let err  {
            print(err);
        }
    }
     
    //navigatiebalk onzichtbaar maken
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true);
    }
    
    //elements plaatsen en bewereken
    func setUpElements(){
        loginButton.layer.cornerRadius = 50;
        singUpButton.layer.cornerRadius = 50;
        self.navigationController?.setNavigationBarHidden(true, animated: true);
        
    }
    
    


}

