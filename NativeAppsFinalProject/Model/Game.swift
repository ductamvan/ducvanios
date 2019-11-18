//
//  Game.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 13/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit


struct Game{
    var GameImage : UIImage;
    var Name : String ;
    var Price : Double ;
    var Description : String;
    var Categorie : String;
    
    init(image : UIImage,naam : String, price : Double, description : String, categorie : String) {
        self.GameImage = image;
        self.Name = naam;
        self.Price = price;
        self.Description = description;
        self.Categorie = categorie;
    }
    
}
