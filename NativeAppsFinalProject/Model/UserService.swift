//
//  UserService.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 20/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import Firebase

struct UserService{
    
    static var currentUser : UserProfile?;
    static func observeUserProfile(_ uid : String, completion : @escaping((_ userprofile : UserProfile?)-> ())){
        let userRef = Database.database().reference().child("users/profile/\(uid)");
        
        userRef.observe(.value, with: {snapshot in
            var userprofile : UserProfile?;
            
            if let dict = snapshot.value as? [String : Any],
                let username = dict["username"] as? String
            {
                userprofile = UserProfile(uid: snapshot.key, username: username);
            }
            completion(userprofile);
        })
        
    }
    



}
