//
//  SignUpViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorDetectionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        

      
    }
    
    func setUpElements(){
        ErrorDetectionLabel.alpha = 0;
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
    }
    

}
