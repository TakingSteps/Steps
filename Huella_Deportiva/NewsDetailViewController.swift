//
//  NewsDetailViewController.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/8/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class NewsDetailViewController: UIViewController {

    @IBOutlet weak var newsTitleLabel: UILabel!
    
    
    @IBOutlet weak var newsBodyLabel: UILabel!
    
    @IBOutlet weak var photoView: PFImageView!
   
    @IBOutlet weak var deleteButton: UIButton!
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    var step: Bool!
    var news: [PFObject]!
    var index: Int?
    //var image: UIImage!
    
    //var new: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let new = news![index!]
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: infoView.frame.origin.y + infoView.frame.size.height)
        
        newsTitleLabel.text = new["title"] as? String
        newsBodyLabel.text = new["body"] as? String
        authorLabel.text = new["user"] as? String
       // photoView.image = image
       // print(image)
        self.photoView.file = new["image"] as? PFFile
        self.photoView.loadInBackground()
        //let file = new["image"] as? PFFile
        //let url = NSURL(string: (file?.url)!)
        //photoView.setImageWithURL(url!)
        //print(image)
        
        let user = PFUser.currentUser()!.username! as String
        let usern = new["user"] as! String
        let adminStatus = PFUser.currentUser()?.objectForKey("admin") as! Int
        
        
     
        if user == usern || adminStatus == 0 {
            deleteButton.hidden = false
            print("okay man")
        }else{
            deleteButton.hidden = true
        }
        
        
        
        
        
        
        
       
       
        
        
      /*  let userPicture = new["image"] as? PFFile
            userPicture!.getDataInBackgroundWithBlock({
                (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data:imageData!)
                    self.image = image
                    print(self.image)
                    self.photoView.image = self.image
                }
            })*/
        
        
        
        
        

        
        // Do any additional setup after loading the view.
    }
    @IBAction func deleteButton(sender: AnyObject) {
        let new = news![index!]
        new.deleteInBackground()
        
        navigationController?.popViewControllerAnimated(true)
               
        
        
        
    }

    @IBAction func stepButton(sender: AnyObject) {
       let new = news![index!]
               
        
        
        
        
            new.incrementKey("steps")
        
            new.saveInBackgroundWithBlock {
                (success: Bool, error: NSError?) -> Void in
                if (success) {
                    
                    
                } else {
                    
                    
                }
            
        
        
        }
        
        stepButton.enabled = false


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var stepButton: UIButton!
    
   /* @IBAction func shareButton(sender: AnyObject) {
        
        let composer = TWTRComposer()
        
        composer.setText("just setting up my Fabric")
        composer.setImage(UIImage(named: "fabric"))
        
        // Called from a UIViewController
        composer.showFromViewController(self) { result in
            if (result == TWTRComposerResult.Cancelled) {
                println("Tweet composition cancelled")
            }
            else {
                println("Sending tweet!")
            }
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
    }
    */

}
