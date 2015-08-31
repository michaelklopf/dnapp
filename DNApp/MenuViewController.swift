//
//  MenuViewController.swift
//  DNApp
//
//  Created by Michael on 31.08.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var dialogView: DesignableView!
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        dialogView.animation = "fall"
        dialogView.animateNext{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}
