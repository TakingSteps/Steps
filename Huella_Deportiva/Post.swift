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
    var image: UIImage?
    var steps: Int?
    
    
    
    init(title: String, newsBody: String, user: String, image: UIImage, steps: Int){
        self.title = title
        self.newsBody = newsBody
        self.user = user
        self.image = image
        self.steps = 0
        
        
    }
    
    func getPFFileFromImage(image: UIImage?) -> PFFile? {
        
        if let image = image {
            
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
    
    
    func post(){
        let post = PFObject(className: "news")
        
        post.setObject(title!, forKey: "title")
        post.setObject(newsBody!, forKey: "body")
        post.setObject(user!, forKey: "user")
        post.setObject(getPFFileFromImage(image)!, forKey: "image")
        post.setObject(steps!, forKey: "steps")
        
        
        
        
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
