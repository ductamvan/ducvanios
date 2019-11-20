//
//  UserProfile.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 20/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit


struct UserProfile {
    var uid : String;
    var username : String;
    
    init(uid : String, username : String){
        self.uid = uid;
        self.username = username;
    }
    
}
