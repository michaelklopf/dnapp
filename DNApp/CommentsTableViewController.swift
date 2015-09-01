//
//  CommentsTableViewController.swift
//  DNApp
//
//  Created by Michael on 01.09.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class CommentsTableViewController: UITableViewController {

    var story = [String: AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(story)
    }
}
