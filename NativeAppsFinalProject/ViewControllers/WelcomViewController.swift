//
//  WelcomViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 04/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class WelcomViewController: UIViewController {

    
    @IBOutlet weak var WelcomsLabel: UILabel!
    @IBOutlet weak var Naam: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn();
        self.continueButton.layer.cornerRadius = 15;
        
    }
    
   //controleer naam zetten bij inlogscherm
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            do{
                try Auth.auth().signOut();
            }catch let error{
                print(error);
            }
        }else {
            let uid = Auth.auth().currentUser?.uid;
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {
                snapshot in
                if let dict = snapshot.value as? [String : Any]{
                    
                    self.Naam.text = "\(dict["name"] as! String + ".")" ;
                    
                    
                
                }
                
                
            });
  
        }
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
       
        let VC = segue.destination as! PostMakerViewController;
        VC.CurrentUser = self.Naam.text!;
        
        }
        
    }*/

}
