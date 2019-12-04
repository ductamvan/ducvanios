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

public struct Post {
    var Persoon : String = "";
    var Text : String = "";
    var Likes : Int = 0;
    var Dislikes : Int = 0;
    
    
    init(text : String, persoon : String, likes : Int, dislikes : Int) {
        self.Text = text;
        self.Persoon = persoon;
        self.Dislikes = dislikes;
        self.Likes = likes;
        
        
    }
    
   
    
}
