//
//  ReservationMakerViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 23/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class ReservationMakerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var Activities = ["Bierpong","Wie Is Het?"];
    var CurrentActivity : String = "";
   
    @IBOutlet weak var ActivityPicker: UIPickerView!
    @IBOutlet weak var dayPicker: UIDatePicker!
    @IBOutlet weak var startHourPicker: UIDatePicker!
    @IBOutlet weak var endHourPicker: UIDatePicker!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad();
        ActivityPicker.setValue(UIColor.white, forKeyPath: "textColor");
        dayPicker.setValue(UIColor.white, forKeyPath: "textColor")
        startHourPicker.setValue(UIColor.white, forKeyPath: "textColor")
        endHourPicker.setValue(UIColor.white, forKeyPath: "textColor");
        self.confirmButton.layer.cornerRadius = 18;
        
        //
        self.ActivityPicker.delegate = self;
        self.ActivityPicker.dataSource = self;
        

        
        
    }
//picker funcs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
       }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Activities.count;
       }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        Activities[row];
    }
    

  

}
