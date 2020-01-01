//
//  Reservation.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 25/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
//struct reservation
struct Reservation {
    var Activity : String;
    var Day : String;
    var StartHour : String;
    var EndHour : String;
    
    //constructor
    init(activity : String, day: String, starthour : String, endhour : String){
        self.Activity = activity;
        self.StartHour = starthour;
        self.EndHour = endhour;
        self.Day = day;
        
    }
}
