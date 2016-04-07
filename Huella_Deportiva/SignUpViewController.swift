//
//  SignUpViewController.swift
//  Huella_Deportiva
//
//  Created by Javier Bustillo on 4/5/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import Parse
class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var photoView: UIImageView!
   
    
    var image: UIImage = UIImage()
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.presentViewController(imagePicker, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpButton(sender: AnyObject) {
        let c = userText.text?.characters.count
        let d = passwordText.text?.characters.count
        
        if ( c != 0 && d != 0){
           
            let image = resizeImg(photoView.image!, newSize: CGSizeMake(200,200))
            let pfImage = getPFFileFromImage(image)
            
            
            let newUser = PFUser()
            newUser.username = userText.text
            newUser.password = passwordText.text
            newUser["prof_image"] = pfImage
            newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
                if success{
                    print("yay")
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                }else{
                    print(error?.localizedDescription)
                    }
            }
        }else{
            print("missing username or password")
            let alert = UIAlertController(title: "Try again", message: "Missing username or password", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
       
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    
    self.image = originalImage
    photoView!.image = image
    dismissViewControllerAnimated(false, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func resizeImg(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func cancelBatman(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    
        
    }
    @IBAction func cameraButton(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func existingButton(sender: AnyObject) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
        
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)

    }
    func getPFFileFromImage(image: UIImage?) -> PFFile? {
        
        if let image = image {
            
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
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
