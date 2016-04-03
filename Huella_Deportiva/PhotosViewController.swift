//
//  PhotosViewController.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/10/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    
    

    @IBOutlet weak var bodyField: UITextView!
    @IBOutlet weak var PhotosLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postButton(sender: AnyObject) {
      let noticia = Post(title: textField.text!, newsBody: bodyField.text! )
        noticia.post()
        
        
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
