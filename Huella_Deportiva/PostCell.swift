//
//  PostCell.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/8/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//
import Parse
import UIKit
import ParseUI


class PostCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var newsBodyLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var stepCounter: UILabel!
    
    @IBOutlet weak var photoView: PFImageView!
    var timeStampString: String!
    var timestamp: NSDate!
    
    
    
    var news: PFObject!{
        didSet{
        
            
            
            
            
            newsTitle.text = news["title"] as? String
            newsBodyLabel.text = news["body"] as? String
            authorLabel.text = news["user"] as? String
           // photoView.file = news["image"] as? PFFile
          //  photoView.loadInBackground()
            stepCounter.text = ("\(news["steps"]) Steps") as String
            timeLabel.text = "\(returnTime(news.createdAt!))" as String
            
            // let timeStamp = news["_created_at"]["$date"]!
              //  as? NSDate
            
            
            news.createdAt
            
           
            
            timeStampString = news["_created_at"] as? String
            
            
        }
    }
    
    func returnTime(createdAt : NSDate) -> String{
        let seconds = NSDate().timeIntervalSinceDate(createdAt)
        if(seconds < 60){
            return String("Just Now")
        }else{
            let minutes = Int(seconds/60)
            if(minutes > 59){
                let hours = Int(minutes/60)
                if hours > 23{
                    let days = Int(hours/24)
                    return String("\(days)d ago")
                }else{
                    return String("\(hours)h ago")
                }
            }else{
                return String("\(minutes)m ago")
            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
