//
//  SportsViewController.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/10/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var SportsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
