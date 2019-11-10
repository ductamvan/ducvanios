//
//  Post.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit


public struct Post {
   
    var Name : String;
    var Text : String;
    var Image : UIImage;
    init(name : String , text : String , image : UIImage) {
        self.Name = name;
        self.Text = text;
        self.Image = image;
    
    }
    
}
