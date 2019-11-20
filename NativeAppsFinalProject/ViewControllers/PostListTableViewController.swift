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
    
  

    @IBOutlet var PostTableView: UITableView!
    let ref = Database.database().reference().child("posts");
      var posts : [Post] = [];
    
    @IBOutlet weak var postButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.postButton.layer.cornerRadius = 15;
        self.PostTableView.delegate = self;
        self.PostTableView.dataSource = self;
        

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
        
        
        
        return cell;
        
        
    }
    

   

}
