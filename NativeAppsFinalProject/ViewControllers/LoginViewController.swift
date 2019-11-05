//
//  LoginViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //outlets

   @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signUpButton: UIButton!
    
   
    @IBOutlet weak var ErrorDetectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //error messages invisible maken
        setUpElements();
        
     
    }
    
     //error messages invisible maken
    func setUpElements() {
        ErrorDetectionLabel.alpha = 0;
        
    }
    
   
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
    }
    
    
    
    
  

}
