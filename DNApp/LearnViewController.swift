//
//  LearnViewController.swift
//  DNApp
//
//  Created by Michael on 30.08.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    @IBOutlet weak var dialogView: DesignableView!

    @IBOutlet weak var bookImageView: SpringImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        dialogView.animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func learnButtonDidTouch(sender: AnyObject) {
        bookImageView.animation = "pop"
        bookImageView.animate()
    }

    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        dialogView.animation = "fall"
        dialogView.animateNext{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
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
