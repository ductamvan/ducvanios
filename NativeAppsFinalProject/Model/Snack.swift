//
//  Snack.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 09/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import Foundation
import UIKit

struct Snack {
    var Image : UIImage;
    var Naam : String;
    var Prijs : Double;
    var Beschrijving : String;
    
    init(image : UIImage, naam : String, prijs : Double, beschrijving : String) {
        self.Image = image;
        self.Naam = naam;
        self.Prijs = prijs;
        self.Beschrijving = beschrijving;
    }
}
