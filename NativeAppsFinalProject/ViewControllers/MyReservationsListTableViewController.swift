//
//  MyReservationsListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 25/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class MyReservationsListTableViewController: UITableViewController {
    var Reservations = [Reservation]();
    var CurrentReservations = [Reservation]();

    override func viewDidLoad() {
        super.viewDidLoad()
        createReservations()
        CurrentReservations = Reservations;
        

    }
    
    func createReservations(){
        let r1 = Reservation(activity: "Bierpong", day: Date(), starthour: Date(), endhour: Date())
        let r2 = Reservation(activity: "Bierpong", day: Date(), starthour: Date(), endhour: Date())
        let r3 = Reservation(activity: "Bierpong", day: Date(), starthour: Date(), endhour: Date())
        let r4 = Reservation(activity: "Bierpong", day: Date(), starthour: Date(), endhour: Date())
        let r5 = Reservation(activity: "Bierpong", day: Date(), starthour: Date(), endhour: Date())
        
        self.Reservations.append(r1);
        self.Reservations.append(r2);
        self.Reservations.append(r3);
        self.Reservations.append(r4);
        self.Reservations.append(r5);
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentReservations.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reservie = CurrentReservations[indexPath.row];
    
        let cell =  tableView.dequeueReusableCell(withIdentifier: "reservationcell", for: indexPath) as! ReservationViewCell
        
        let dateFormatterPrint = DateFormatter();
        dateFormatterPrint.dateFormat = "MMM dd yyyy"
        let timeFormatterPrint = DateFormatter();
        timeFormatterPrint.dateFormat = "HH:mm";
        

        cell.Activity.text = reservie.Activity;
        cell.Day.text = "\(dateFormatterPrint.string(from: reservie.Day))";
        cell.startHour.text = "\(timeFormatterPrint.string(from: reservie.Day))";
        cell.endHour.text = "\(timeFormatterPrint.string(from: reservie.Day))";
        
        
        
        cell.selectionStyle = .none;
        
        return cell
    }
    


  

}
