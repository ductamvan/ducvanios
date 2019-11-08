//
//  PostListTableViewController.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit


class PostListTableViewController: UITableViewController{
    
    var posts : [Post] = [];

    @IBOutlet var PostTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = createPosts();
        self.PostTableView.delegate = self;
        self.PostTableView.dataSource = self;
        
      
       
        
        

    }
    
    func createPosts() -> [Post]{
        let post1 = Post(name: "News Distributor", text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h.");
        let post2 = Post(name: "News Distributor", text: "Fifa Tournament coming soon... Stay tuned.");
        let post3 = Post(name: "News Distributor", text: "Techo party. Doors 20h!");
        let post4 = Post(name: "News Distributor", text: "Found car keys, the owner may come and get it.");
        let post5 = Post(name: "New Distributor", text: "There is a new drink, in our Collection. Go check it out in the Discovery tab!");
        let post6 = Post(name: "News Distributor", text: "Don't forget to close your bikes! Thieves are around!");
        
        var posten : [Post] = [];
        
        posten.append(post1);
        posten.append(post2);
        posten.append(post3);
        posten.append(post4);
        posten.append(post5);
        posten.append(post6);
        return posten;
    }
    
    

    // MARK: - Table view data source
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postie = posts[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for : indexPath) as! PostViewCell;
        cell.PersonNameImage.text = postie.Name;
        cell.PostContext.text = postie.Text;
        return cell;
        
        
    }
    

   

}
