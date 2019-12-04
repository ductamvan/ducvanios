//
//  ReservationMakerViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 23/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import Firebase


class ReservationMakerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var Activities = ["Bierpong","Wie Is Het?"];
    var CurrentActivity : String = "";
   
    @IBOutlet weak var ActivityPicker: UIPickerView!
    @IBOutlet weak var dayPicker: UIDatePicker!
    @IBOutlet weak var startHourPicker: UIDatePicker!
    @IBOutlet weak var endHourPicker: UIDatePicker!
    @IBOutlet weak var confirmButton: UIButton!
    
    var selectedActivity : String = "";
    
    
    
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
    
    
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        if(CurrentActivity == ""){
            print("Select all Values");
            let alert = UIAlertController(title: "Error", message: "Fill in all choices", preferredStyle: .alert);
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
            alert.addAction(OK);
            self.present(alert, animated: true, completion: nil);
             
        }
        else{
            
            guard let uid = Auth.auth().currentUser?.uid else{return};
            
            let dagformatter = DateFormatter();
            dagformatter.dateFormat = "dd/MM/yyyy"
            let dag = dagformatter.string(from: dayPicker.date)
            let timeformatter = DateFormatter();
            timeformatter.dateFormat = "HH:mm:ss"
            let starttijd = timeformatter.string(from: startHourPicker.date);
            let stoptijd = timeformatter.string(from: endHourPicker.date);
            
            

            let ref = Database.database().reference(fromURL: "https://nativeappsiiproject.firebaseio.com/");
            let userref = ref.child("users").child(uid).child("reservations").childByAutoId();
            let values = ["activiteit" : self.CurrentActivity , "dag" : dag , "start" : starttijd, "stop" : stoptijd]
                as [String : Any];
            
            
            
            userref.updateChildValues(values, withCompletionBlock: {
                (error, ref) in
                if error != nil {
                    print(error!.localizedDescription);
                    return;
                }
                
                print("reservation made");
                let alert = UIAlertController(title: "Confirmed", message: "Reservation made", preferredStyle: .alert);
                let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                alert.addAction(OK);
                self.present(alert, animated: true, completion: nil);
                
                
               
                    }
        
            ) }
    }
    
    
    
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.CurrentActivity = Activities[row];
    }
    
    
    
 
}

