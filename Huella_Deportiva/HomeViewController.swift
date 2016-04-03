//
//  HomeViewController.swift
//  Huella_Deportiva
//
//  Created by Cristian Melendez on 3/8/16.
//  Copyright © 2016 Cristian Melendez. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import Parse


class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
 {
    
    @IBOutlet weak var MenuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var news: [PFObject]!

    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        MenuButton.target = self.revealViewController()
        
        MenuButton.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        let query = PFQuery(className: "news")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        
        
        
        query.findObjectsInBackgroundWithBlock { (news: [PFObject]?, error: NSError?) -> Void in
            if let news = news {
                self.news = news
                self.tableView.reloadData()
                print("woo")
            } else {
                // handle error
                print(error?.localizedDescription)
                print(error?.code)
            }
        }
        
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let news = news {
            return news.count
        }
        else{
        return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
        
        cell.news = news![indexPath.row]
        
        
        
        
        
        return cell
    }
    
    
    @IBAction func logoutButton(sender: AnyObject) {
        PFUser.logOutInBackground()
        dismissViewControllerAnimated(false, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "SegueToDetail"
        {
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            //let selectedNew = news![indexPath!.row]
            let index = indexPath!.row
            
            
            let newsDetailVC = segue.destinationViewController as! NewsDetailViewController
            
            newsDetailVC.news = news
            newsDetailVC.index = index
            
            
            
            
            
            
        }
    }

    
            
        }
        
    


