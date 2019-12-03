//
//  PostMakerViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 20/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit;
import Firebase;

class PostMakerViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var PostButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var postContext: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postContext.layer.borderWidth = 1
        postContext.layer.borderColor = UIColor.white.cgColor;
        
        
    }
    
    func CurrentPerson()-> String{
        var person : String = "";
        let uid = Auth.auth().currentUser!.uid;
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String : AnyObject]{
                person = dict["naam"] as! String;
            }
                
            
            });
        return person;
        
    }
    
   
    
   
    @IBAction func postButtonPressed(_ sender: Any) {
        let postref = Database.database().reference().child("posts").childByAutoId();
        
        let postObject =
        [
            "text" : postContext.text!,
            "persoon" : "\(self.CurrentPerson())"
            ] as [String : Any];
        
        postref.setValue(postObject, withCompletionBlock: {
            (error, result) in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else{
                print("unexpected error");
            }
            
        });
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "tabControlVC") as! UITabBarController
        self.present (vc, animated: true, completion: nil)
    }
    
    
  

}
