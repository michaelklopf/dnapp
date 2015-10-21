//
//  MenuViewController.swift
//  DNApp
//
//  Created by Michael on 31.08.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func menuViewControllerDidTouchTop(controller: MenuViewController)
    func menuViewControllerDidTouchRecent(controller: MenuViewController)

}

class MenuViewController: UIViewController {

    @IBOutlet weak var dialogView: DesignableView!
    
    weak var delegate: MenuViewControllerDelegate?
    
    @IBAction func cancelButtonDidTouch(sender: AnyObject) {
        dialogView.animation = "fall"
        dialogView.animateNext{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func topStoriesButtonDidTouch(sender: AnyObject) {
        delegate?.menuViewControllerDidTouchTop(self)
        cancelButtonDidTouch(sender)
    }
    
    @IBAction func recentButtonDidTouch(sender: AnyObject) {
        delegate?.menuViewControllerDidTouchRecent(self)
        cancelButtonDidTouch(sender)
    }
    
    @IBAction func loginButtonDidTouch(sender: AnyObject) {
        
    }
}
