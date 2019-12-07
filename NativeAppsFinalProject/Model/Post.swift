//
//  Post.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit
import Firebase

public struct Post :Codable {
    var Persoon : String = "";
    var Text : String = "";
    var Likes : String;
    var Dislikes : String;
    
    
    init(text : String, persoon : String, likes : String, dislikes : String) {
        self.Text = text;
        self.Persoon = persoon;
        self.Dislikes = dislikes;
        self.Likes = likes;
        
        
    }
    
   
    
}
