//
//  PrizesTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 09/12/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import Firebase

class PrizesTableViewController: UITableViewController {
    var Prizes : [Prize] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        createPrizes();

    }
    
    //prijzen halen
    func createPrizes(){
        let uid = Auth.auth().currentUser?.uid;
               let dbref = Database.database().reference(fromURL: "https://nativeappsiiproject.firebaseio.com/").child("users").child(uid!).child("prizes");
        
        dbref.observe(.childAdded, with : {
        (snapshot) in
        
         let res = snapshot.value as? NSDictionary;
         if let prize  = res {
         let codie : String = prize.value(forKey: "code") as! String;
         let exp : String = prize.value(forKey: "expdate") as! String;
            
         self.Prizes.append(Prize(code: codie, expdate: exp));
        }
        self.tableView.reloadData();
        
            
            
            
        });
        
    }
    

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Prizes.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let prizie = Prizes[indexPath.row];
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "prizecell", for: indexPath) as! PrizeViewCell;
        
        cell.Code.text = "\(prizie.Code)";
        cell.ExpDate.text = "\(prizie.ExpireDate)";

       
        cell.selectionStyle = .none;
        return cell
    }
    


}
