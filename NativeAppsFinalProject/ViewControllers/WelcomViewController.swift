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
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn();

    }
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            do{
                try Auth.auth().signOut();
            }catch let error{
                print(error);
            }
        }else {
            Database.database().reference().child("users").observeSingleEvent(of: .value, with: {
                snapshot in
                let dict = snapshot.value as? [String : Any];
                let user = CurrentUser(uid: Auth.auth().currentUser!.uid, dict: dict!);
                print(user);
                
            });
  
        }
    }
    
}
