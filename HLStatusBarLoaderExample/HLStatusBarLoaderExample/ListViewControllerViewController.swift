//
//  ViewController.swift
//  HLStatusBarLoaderExample
//
//  Created by Hervé Heurtault de Lammerville on 21/10/14.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: "refreshControlTriggered:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    func refreshControlTriggered(sender: AnyObject?) {

        self.showStatusBarHUD()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4.5 * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue()) { () -> Void in
            
                self.refreshControl.endRefreshing()
                self.hideStatusBarHUD()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "News Feed"
        
        self.statusBarHUDForegroundColor = UIColor(red: 205.0/255.0, green: 200.0/255.0, blue: 41.0/255.0, alpha: 0.85)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        struct TokenHolder {
            static var token: dispatch_once_t = 0;
        }
        
        dispatch_once(&TokenHolder.token) {
            
            self.refreshControl.beginRefreshing()
            self.tableView.contentOffset = CGPointMake(0.0, self.tableView.contentOffset.y - self.refreshControl.frame.size.height)
            
            self.refreshControlTriggered(nil)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 120
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("newsCell") as UITableViewCell
        
        cell.textLabel?.text = "Hello, world!"
        cell.detailTextLabel?.text = "This is a sample status"
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60.0
    }
}
