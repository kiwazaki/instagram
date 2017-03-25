//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Iwazaki on 2017/03/06.
//  Copyright © 2017年 Iwazaki. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
     
    override func setSelected(_ selected: Bool, animated: Bool) {

        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setPostData(postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        
        
            /////////コメントを追加し、書き出す/////////////
 /*
        self.commentLabel.text = "\(postData.name!) : \(postData.commentField)"

        var commentArray: [String] = []

 
        let comment = postData.commentArray.joined()
        
        for comment in commentArray{
            commentLabel.text = "\(postData.name!): \(postData.comment)" + "\n"
        }
 
    */    
        //////////////////////////////////
 

        
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
    
        
     
        for commentData in 0 ..< postData.commentArray.count   {
            if commentData > 0 {
                commentLabel.text! = commentLabel.text! + "\(postData.commentArray[commentData])" + "\n"
            } else{
                commentLabel.text! = ""
            }
        }

        
        
        
   /*

        //コメントが入ったら投稿者の名前とコメントを改行しながら追加

        for commentData in 0 ..< postData.commentArray.count   {
            if commentData > 0 {
                commentLabel.text! = commentLabel.text! + "\n"
            } else{
            commentLabel.text! = commentLabel.text! + "\(postData.commentArray[commentData])" + "\n"
        }
        }
 */
        
        
        
        
        
    }

   
    
}


