//
//  ViewController.swift
//  QZCircleSegue
//
//  Created by Alex Tarragó on 4/11/15.
//  Copyright (c) 2015 Dribba Development & Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    /*Create your transition manager instance*/
    var transition = QZCircleSegue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonOne.layer.cornerRadius = 40
        buttonTwo.layer.cornerRadius = 40
        buttonThree.layer.cornerRadius = 40
        
        buttonOne.layer.masksToBounds = true
        buttonTwo.layer.masksToBounds = true
        buttonThree.layer.masksToBounds = true
    }
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueOne") {
            /* Send the button to your transition manager */
            self.transition.animationChild = buttonOne
            /* Set the color to your transition manager*/
            self.transition.animationColor = UIColor(red: 46/255, green: 195/255, blue: 179/255, alpha: 1.0)
        } else if (segue.identifier == "segueTwo") {
            self.transition.animationChild = buttonTwo
            self.transition.animationColor = UIColor(red: 252/255, green: 63/255, blue: 85/255, alpha: 1.0)
        } else if (segue.identifier == "segueThree") {
            self.transition.animationChild = buttonThree
            self.transition.animationColor = UIColor(red: 237/255, green: 204/255, blue: 64/255, alpha: 1.0)
        }
        let toViewController = segue.destinationViewController as! NewViewController
        /* Set both, the origin and destination to your transition manager*/
        self.transition.fromViewController = self
        self.transition.toViewController = toViewController
        /* Add the transition manager to your transitioningDelegate View Controller*/
        toViewController.transitioningDelegate = transition
    }
    
    /* REQUIRED, do not connect to any Outlet.
       BUG DETECTED? Exit segue doesn't dismiss automatically, so we have to dismiss it manually.
    */
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

