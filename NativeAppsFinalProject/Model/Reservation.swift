//
//  Reservation.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 25/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
struct Reservation {
    var Activity : String;
    var Day : Date;
    var StartHour : Date;
    var EndHour : Date;
    
    init(activity : String, day: Date, starthour : Date, endhour : Date){
        self.Activity = activity;
        self.StartHour = starthour;
        self.EndHour = endhour;
        self.Day = day;
        
    }
}
