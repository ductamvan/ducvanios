//
//  LoginViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    //outlets

   @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signUpButton: UIButton!
    let ref = Database.database().reference()
    
   
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
    
   
    func transitionToWelcomeScreen(){
        let WelcomeScreenVC = storyboard?.instantiateViewController(identifier: "WelcomeScreenVC") as? WelcomViewController;
        view.window?.rootViewController = WelcomeScreenVC;
        view.window?.makeKeyAndVisible();
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        //password en email cleanen
        let cleanEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);

        Auth.auth().signIn(withEmail : cleanEmail , password: cleanPassword ){
            (result,error) in
            //error logging in as a user
            if(error != nil){
                self.ErrorDetectionLabel.text = error?.localizedDescription;
                self.ErrorDetectionLabel.alpha = 1;
                
                let alert = UIAlertController(title: "Error", message: "Credentials are invalid", preferredStyle: .alert);
                let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                alert.addAction(OK);
                self.present(alert, animated: true, completion: nil);
            }
            else{
                self.transitionToWelcomeScreen();
            }
        }
    }

}
    

