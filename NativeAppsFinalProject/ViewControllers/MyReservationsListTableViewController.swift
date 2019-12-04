//
//  MyReservationsListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 25/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import Firebase


class MyReservationsListTableViewController: UITableViewController {
    var Reservations : [Reservation] = [];
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createReservations();
        print("view appeared");
    

    }
    
    
    
    
   
    
    func createReservations(){
       
        let uid = Auth.auth().currentUser?.uid;
        let dbref = Database.database().reference(fromURL: "https://nativeappsiiproject.firebaseio.com/").child("users").child(uid!).child("reservations");
      
        
        //loop van alle reservations in DB
        dbref.observe(.childAdded, with : {
            (snapshot) in
            
            let res = snapshot.value as? NSDictionary;
             if let actualpost  = res {
             let activ : String = actualpost.value(forKey: "activiteit") as! String;
             let dag : String = actualpost.value(forKey: "dag") as! String;
             let start : String = actualpost.value(forKey: "start") as! String;
             let end : String = actualpost.value(forKey: "stop") as! String;
             
            self.Reservations.append(Reservation(activity: activ, day: dag, starthour: start, endhour: end));
                
            }
        }
            
        );
        
        
       

}

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reservations.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reservie = Reservations[indexPath.row];
    
        let cell =  tableView.dequeueReusableCell(withIdentifier: "reservationcell", for: indexPath) as! ReservationViewCell
        
     
        cell.Activity.text = "\(reservie.Activity)";
        cell.Day.text = "\(reservie.Day)";
        cell.startHour.text = "\(reservie.StartHour)";
        cell.endHour.text = "\(reservie.EndHour)";
        
        
        
        cell.selectionStyle = .none;
        return cell
    }
    


  

}
