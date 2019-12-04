//
//  PostViewCell.swift
//  NativeAppsFinalProject
//
//  Created by Duc Van on 08/11/2019.
//  Copyright © 2019 Duc Van. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var PersonNameImage: UILabel!
    @IBOutlet weak var PostContext: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var numberOfDislikes: UILabel!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var dislikeView: UIView!
    
    
}
