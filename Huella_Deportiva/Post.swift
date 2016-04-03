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
    
    
    init(title: String, newsBody: String){
        self.title = title
        self.newsBody = newsBody
        
    }
    
    
    
    func post(){
        let post = PFObject(className: "news")
        
        post.setObject(title!, forKey: "title")
        post.setObject(newsBody!, forKey: "body")
        
        
        
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
