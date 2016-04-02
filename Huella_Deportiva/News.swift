//
//  News.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/8/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit

class News: NSObject {
    var newstitle: NSString?
    var timeStampString: String?
    var newsImage: UIImage?
    var newsBody: NSString
    
    init(dictionary : NSDictionary){
        newstitle = dictionary["title"] as! String
        timeStampString = dictionary["created_at"] as? String
     //   let imageURL = dictionary["title"] as! String
     //   newsImage =
        newsBody = dictionary["news_body"] as! String
        
        
    }
}
