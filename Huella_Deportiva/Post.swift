//
//  Post.swift
//  Huella_Deportiva
//
//  Created by Javier Bustillo on 3/31/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import Parse


class Post: NSObject {
    
    
    var title: String?
    var newsBody: String?
    var user: String?
    
    
    
    init(title: String, newsBody: String, user: String){
        self.title = title
        self.newsBody = newsBody
        self.user = user
        
    }
    
    
    
    func post(){
        let post = PFObject(className: "news")
        
        post.setObject(title!, forKey: "title")
        post.setObject(newsBody!, forKey: "body")
        post.setObject(user!, forKey: "user")
        
        
        post.saveInBackgroundWithBlock {
            
            (success: Bool, error: NSError?) -> Void in
            
            if(success){
                print("cool")
            }else{
                print(error?.code)
                
            }
        }
    }

}
