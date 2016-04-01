//
//  PostCell.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/8/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//
import Parse
import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    
    
    @IBOutlet weak var newsBodyLabel: UILabel!
    
    var news: PFObject!{
        didSet{
            newsTitle.text = news["title"] as? String
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
