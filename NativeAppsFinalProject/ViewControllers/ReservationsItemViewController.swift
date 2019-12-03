//
//  ReservationsItemViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import FirebaseAuth

class ReservationsItemViewController: UIViewController {

    @IBOutlet weak var makeReservationButton: UIButton!
    @IBOutlet weak var myReservationButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeReservationButton.layer.cornerRadius = 15;
        self.myReservationButton.layer.cornerRadius = 15;
        self.logOutButton.layer.cornerRadius = 15;
       
    
     
    }
    
    func transitionToBeginScreen(){
        let BeginScreen = storyboard?.instantiateViewController(identifier: "beginscreenVC") as? UINavigationController;
        BeginScreen?.modalPresentationStyle = .fullScreen;
        view.window?.rootViewController = BeginScreen;
        view.window?.makeKeyAndVisible();
    
       }

    @IBAction func logOutButtonPressed(_ sender: Any) {
       
        do {
            try Auth.auth().signOut()
            print("Signed OUT");
            transitionToBeginScreen();
        } catch let error {
            print(error)
        }
        
        
        
    }
    
    
}
