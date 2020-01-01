//
//  ReservationsItemViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ReservationsItemViewController: UIViewController {

    @IBOutlet weak var makeReservationButton: UIButton!
    @IBOutlet weak var myReservationButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var currentUserNaam: UILabel!
    @IBOutlet weak var myPrizesButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //afronden buttons
        self.makeReservationButton.layer.cornerRadius = 10;
        self.myReservationButton.layer.cornerRadius = 10;
        self.myPrizesButton.layer.cornerRadius = 10;
        self.logOutButton.layer.cornerRadius = 15;
        
    
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setCurrentUserNaam();
        
    }
    
    //current user naam tonen
    func setCurrentUserNaam(){
        let uid = Auth.auth().currentUser?.uid;
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String : Any]{
                
                self.currentUserNaam.text = "\(dict["name"] as! String)" ;
                
            }
        
        });
        
    }
    //naar beginscherm
    func transitionToBeginScreen(){
        let BeginScreen = storyboard?.instantiateViewController(identifier: "beginscreenVC") as? UINavigationController;
        BeginScreen?.modalPresentationStyle = .fullScreen;
        BeginScreen?.modalTransitionStyle = .coverVertical;
        self.present(BeginScreen!, animated: true, completion: nil);
        
    
       }

    //log out
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
