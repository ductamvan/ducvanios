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

    @IBOutlet var PostTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.PostTableView.delegate = self;
        self.PostTableView.dataSource = self;
        posts = createPosts();
    

    }
    
    
    
    //posts creatie
    func createPosts() -> [Post]{
        let post1 = Post(name: "News Distributor"
            ,text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h. Lead Singer Jelle Van De Wiele will sing us his latest songs."
            ,image: UIImage(named: "unlock dialogue")! );
        let post2 = Post(name: "News Distributor"
        ,text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h. Lead Singer Jelle Van De Wiele will sing us his latest songs."
        ,image: UIImage(named: "unlock dialogue")! );
        let post3 = Post(name: "News Distributor"
        ,text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h. Lead Singer Jelle Van De Wiele will sing us his latest songs."
        ,image: UIImage(named: "unlock dialogue")! );
        let post4 = Post(name: "News Distributor"
        ,text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h. Lead Singer Jelle Van De Wiele will sing us his latest songs."
        ,image: UIImage(named: "unlock dialogue")! );
        let post5 = Post(name: "News Distributor"
        ,text: "Unlock Dialogue will perform this Saturday on our mini-stage. Doors 22h. Lead Singer Jelle Van De Wiele will sing us his latest songs."
        ,image: UIImage(named: "unlock dialogue")! );
        var posten : [Post] = [];
        posten.append(post1);
        posten.append(post2);
        posten.append(post3);
        posten.append(post4);
        posten.append(post5);
        
        return posten;
    }
    
    

    // MARK: - Table view data source
    

    //in table view steken
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count;
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let postie = posts[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for : indexPath) as! PostViewCell;
        
        cell.PersonNameImage.text = postie.Name;
        cell.PostContext.text = postie.Text;
        cell.PostImage.image = postie.Image;
        
        return cell;
        
        
    }
    

   

}
