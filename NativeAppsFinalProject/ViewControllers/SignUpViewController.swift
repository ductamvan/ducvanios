//
//  SignUpViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//
import UIKit
//import FirebaseAuth
import Firebase
class SignUpViewController: UIViewController {
    //outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var ErrorDetectionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //error messages invisble maken
        setUpElements()
    }

    //error messages invisble maken
    func setUpElements(){
        ErrorDetectionLabel.alpha = 0;
    }

    func validateFields() -> String?{
        //check if all the fields are filled in.
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Fill In All Spaces!";
        }
        //checks if the password is secure
        let cleanPassword = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines);
        if isPasswordValid(cleanPassword!) == false {
            return "Password Must Contains 8 Characters And 1 Symbol!";
        }
        return nil;
    }

    //password validation code <<https://iosdevcenters.blogspot.com/2017/06/password-validation-in-swift-30.html>>
    //8characters en minstens 1 symbool
    public func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

    //transitie naar het welkom scherm
    func transitionToWelcomeScreen(){
        let WelcomeScreenVC = storyboard?.instantiateViewController(identifier: "WelcomeScreenVC") as? WelcomViewController;
        view.window?.rootViewController = WelcomeScreenVC;
        view.window?.makeKeyAndVisible();
    }

    //when sign up button pressed
    @IBAction func signUpButtonTapped(_ sender: Any) {
        //sign up failed
        let error = validateFields();
        if error != nil {
            ErrorDetectionLabel.alpha = 1;
            ErrorDetectionLabel.text = error!;
            let alert = UIAlertController(title: "Error", message: "Error Creating User", preferredStyle: .alert);
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            alert.addAction(OK);
            self.present(alert, animated: true, completion: nil);
            
            
        }
        else {
            //email en passwoord "cleanen"
            let cleanEmail =  emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let cleanFirstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            let cleanLastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines);
            // user was created successfully firstname and lastname stored.
            //new user gemaakt in firebase autheratization
            
            Auth.auth().createUser(withEmail: cleanEmail, password: cleanPassword){
                (result,error) in
                //there was an error created when creating an user
                if error != nil{
                    //self.transitionToWelcomeScreen(); //testcode
                    print(error?.localizedDescription as Any);
                    self.ErrorDetectionLabel.text = "Error Creating User";
                    self.ErrorDetectionLabel.alpha = 1;
                    //error geven in alert
                    let alert = UIAlertController(title: "Error", message: "Unexpected Error", preferredStyle: .alert);
                    let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                    alert.addAction(OK);
                    self.present(alert, animated: true, completion: nil);
                    
                }
                else{
                    //database wordt aangesproken
                    //nieuwe user in map users gestoken
                    //uid van user word ook vastgesteld door user uid te nemen van het gecreeerde object
                    let database = Firestore.firestore();
                    database.collection("users")
                        .addDocument(data:["firstname" : cleanFirstName, "lastname" : cleanLastName, "uid" : result!.user.uid]){
                        (error) in
                        if error != nil {
                            self.ErrorDetectionLabel.text = "User Data Couldn't validate";
                        }
                    }
                    self.transitionToWelcomeScreen();
                }
            }
        }
    }
    
}
