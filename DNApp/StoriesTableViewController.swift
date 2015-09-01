//
//  StoriesTableViewController.swift
//  DNApp
//
//  Created by Michael on 31.08.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class StoriesTableViewController: UITableViewController, StoryTableViewCellDelegate {
    
    let transitionManager = TransitionManager()

    @IBAction func menuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }

    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("LoginSegue", sender: self)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryCell") as! StoryTableViewCell
        
        let story = data[indexPath.row]
        cell.configureWithStory(story)
        
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("WebSegue", sender: indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }
    
    // MARK: StoryTableViewCellDelegate
    func storyTableViewCellDidTouchUpvote(cell: StoryTableViewCell, sender: AnyObject) {
        // TODO: WAAH
    }
    
    func storyTableViewCellDidTouchComment(cell: StoryTableViewCell, sender: AnyObject) {
        performSegueWithIdentifier("CommentsSegue", sender: cell)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CommentsSegue" {
            if let cell = sender as? UITableViewCell {
                let toView = segue.destinationViewController as! CommentsTableViewController
                let indexPath = tableView.indexPathForCell(cell)
                toView.story = data[indexPath!.row]
            }
        }
        
        if segue.identifier == "WebSegue" {
            if let toView = segue.destinationViewController as? WebViewController {
                if let indexPath = sender as? NSIndexPath {
                    toView.url = data[indexPath.row]["url"].string!
                    toView.transitioningDelegate = transitionManager
                }
            }
            UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: UIStatusBarAnimation.Fade)
            // Setting "View controller-based status bar appearance" to NO is necessary for working with that
        }
    }
}
