//
//  CommentsTableViewController.swift
//  DNApp
//
//  Created by Michael on 01.09.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    var story: JSON!
    var comments: JSON!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        comments = story["comments"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StoryCell") as! StoryTableViewCell
        cell.configureWithStory(story)
        return cell
    }
}
