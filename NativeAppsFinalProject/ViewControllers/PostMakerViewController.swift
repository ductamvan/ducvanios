//
//  PostMakerViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 20/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit;
import FirebaseDatabase
import FirebaseAuth


class PostMakerViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var PostButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var postContext: UITextView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postContext.layer.borderWidth = 1
        postContext.layer.borderColor = UIColor.white.cgColor;
        
        
        
        
        
    }
    
    /*func CurrentPerson()-> String{
        var person : String = "";
        let uid = Auth.auth().currentUser!.uid;
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: {
            snapshot in
            if let dict = snapshot.value as? [String : AnyObject]{
                person = dict["naam"] as! String;
            }
                
            
            });
        return person;
        
    }*/
    
    
    
   
    
   
    @IBAction func postButtonPressed(_ sender: Any) {
        
        if(self.postContext.text == ""){
            
            let alert = UIAlertController(title: "Error", message: "There's no joke.", preferredStyle: .alert);
            let OK = UIAlertAction(title: "OK", style: .cancel, handler: nil);
                alert.addAction(OK);
                self.present(alert, animated: true, completion: nil);
            
        }else{
           let uid = Auth.auth().currentUser?.uid;
          //  let postref = Database.database().reference().child("users").child(uid!).child("posts").childByAutoId();
          //  let posts =  Database.database().reference().child("posts").childByAutoId();
            let userref = Database.database().reference().child("users").child(uid!);
             
            
            
            
            userref.observeSingleEvent(of: .value, with: { snapshot in
                let uid = Auth.auth().currentUser?.uid;
                let postref = Database.database().reference().child("users").child(uid!).child("posts").childByAutoId();
                let posts =  Database.database().reference().child("posts").childByAutoId();
               
                
                var CurrentUser : String = "";
                let dict = snapshot.value as? [String : Any];
                let naam = dict!["name"] as! String;
                CurrentUser = naam;
                print(CurrentUser);
                 

                let postObject =
                [
                    "text" : self.postContext.text!,
                    "persoon" : CurrentUser,
                    "likes" : "\(0)",
                     "dislikes" : "\(0)"
                   
                    ] as [String : Any];
                
               postref.setValue(postObject, withCompletionBlock: {
                                    (error, result) in
                                    if error == nil {
                                        self.dismiss(animated: true, completion: nil)
                                    } else{
                                        print("unexpected error");
                                    }
                                    
                                });
                

                posts.setValue(postObject, withCompletionBlock: {
                    (error, result) in
                    if error == nil {
                        self.dismiss(animated: true, completion: nil)
                    } else{
                        print("unexpected error");
                    }
                    
                });
                         

            })
            
            
            
            
          
            
        
            
                  
                   
        }
      
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "tabControlVC") as! UITabBarController
        self.present (vc, animated: true, completion: nil)
    }
    
    
  

}
