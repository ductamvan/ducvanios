//
//  Prize.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 09/12/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit
//struct prize
struct Prize {
    var Code : String;
    var ExpireDate : String;
    
    //constructor
    init(code : String, expdate: String){
        self.Code = code;
        self.ExpireDate = expdate;
       
        
    }
}
