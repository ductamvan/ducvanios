//
//  currentUser.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 02/12/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit

struct CurrentUser : Codable{
    let uid : String;
    let name : String;
   
    
    init(uid : String , dict : [String : Any ]) {
        self.uid = dict["uid"] as? String ?? "";
        self.name = dict["naam"] as? String ?? "";
        
    }
    
}
