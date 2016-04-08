//
//  SettingsViewController.swift
//  Huella_Deportiva
//
//  Created by Javier Bustillo on 4/3/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import Parse
import SlideMenuControllerSwift
import ParseUI


class SettingsViewController: UIViewController {
    @IBOutlet weak var currentUserLabel: UILabel!

    @IBOutlet weak var profileImage: PFImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
            currentUserLabel.text = PFUser.currentUser()?.username
            profileImage.file = PFUser.currentUser()?.objectForKey("prof_image") as? PFFile
            profileImage.loadInBackground()
            
        
                
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutButton(sender: AnyObject) {
        PFUser.logOutInBackground()
        
        self.performSegueWithIdentifier("logout", sender: nil)
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
