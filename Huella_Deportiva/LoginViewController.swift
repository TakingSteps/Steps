//
//  LoginViewController.swift
//  Huella_Deportiva
//
//  Created by Javier Bustillo on 4/3/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        
        
        PFUser.logInWithUsernameInBackground(userText.text!, password: passwordText.text!) { (user: PFUser?, error: NSError?) -> Void in
            if user != nil{
                print("logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }else{
                let alert = UIAlertController(title: "Try again", message: "\(error!.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
        }
    }

    @IBAction func signUpButton(sender: AnyObject) {
       self.performSegueWithIdentifier("signUpSegue", sender: nil)
        
    }
    @IBAction func onTap(sender: AnyObject) {
         view.endEditing(true)
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
