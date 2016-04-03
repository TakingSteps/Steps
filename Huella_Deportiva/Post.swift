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
    
    init(title: String){
        self.title = title
    }
    
    func post(){
        let post = PFObject(className: "news")
        
        post.setObject(title!, forKey: "title")
        
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
