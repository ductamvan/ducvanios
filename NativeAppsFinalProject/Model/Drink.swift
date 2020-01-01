//
//  Drink.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 12/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit

//struct drink
struct Drink {
    var Image : UIImage;
    var Naam : String;
    var Prijs : Double;
    var Beschrijving : String;
    var Categorie : String;
    var AlcoholPerc : Double;
    //constructor
    init(image : UIImage, naam : String, prijs : Double, beschrijving : String, categorie : String, alcoholperc : Double) {
        self.Image = image;
        self.Naam = naam;
        self.Prijs = prijs;
        self.Beschrijving = beschrijving;
        self.Categorie = categorie;
        self.AlcoholPerc = alcoholperc;
    }
    
}
