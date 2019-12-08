//
//  PostListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit
import Firebase





class PostListTableViewController: UITableViewController{
    
  

    
    
    var posts : [Post] = [];
    
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet var PostTableView: UITableView!
    
    @IBOutlet weak var postButton: UIButton!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postButton.layer.cornerRadius = 15;
        self.PostTableView.delegate = self;
        self.PostTableView.dataSource = self;
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //clear posts
        self.posts.removeAll();
        //reference
        let ref = Database.database().reference();
        //retrieve posts and listen for changes
        ref.child("posts").observe(.childAdded, with: {
            (snapshot) in
            let post = snapshot.value as? NSDictionary;
            if let actualpost  = post {
                let tekst : String = actualpost.value(forKey: "text") as! String;
                let pers : String = actualpost.value(forKey: "persoon") as! String;
                
               
                
              
                self.posts.append(Post(text: tekst,persoon: pers));
                self.posts.reverse();
                self.tableView.reloadData();
            }
        });
        //reload table
        
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        //clear posts
        self.posts.removeAll();
               //reference
        let ref = Database.database().reference();
               //retrieve posts and listen for changes
        ref.child("posts").observe(.childAdded, with: {
                   (snapshot) in
        let post = snapshot.value as? NSDictionary;
        if let actualpost  = post {
        let tekst : String = actualpost.value(forKey: "text") as! String;
        let pers : String = actualpost.value(forKey: "persoon") as! String;
            
         
                                 
        self.posts.append(Post(text: tekst,persoon: pers));
        self.posts.reverse();
        self.tableView.reloadData();
       
        print("page refreshed");
            }
            
        }
        
    );
    }
    
    
    //posts creatie
    
    
    

    // MARK: - Table view data source
    

    //in table view steken
    
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postie = posts[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for : indexPath) as! PostViewCell;
        
        
        cell.PostContext.text = postie.Text;
        cell.PersonNameImage.text = postie.Persoon;
        
        
        
        
        
        
        
        
        return cell;
        
        
    }
    

   

}

