//
//  QZCircleSegue.swift
//  QZCircleSegue
//
//  Created by Alex Tarragó on 4/11/15.
//  Copyright (c) 2015 Dribba Development & Consulting. All rights reserved.
//

import UIKit

class QZCircleSegue: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate  {
    
    private var presenting = false
    var animationDuration = 0.2
    var animationColor = UIColor.whiteColor()
    var animationChild: AnyObject! = nil
    var fromViewController: AnyObject! = nil
    var toViewController: AnyObject! = nil
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let animationSize = animationChild.frame.size
        let animationPoint = animationChild.center
        
        let container = transitionContext.containerView()
        let screenComp = (UIScreen.mainScreen().bounds.size.height - animationSize.height) / (animationSize.height / 2);

        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!, transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        
        let newViewController = !self.presenting ? screens.from as UIViewController : screens.to as UIViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let newView = newViewController.view
        let bottomView = bottomViewController.view
        
        if (self.presenting){
            self.offStageMenuController(newViewController, fromViewController: bottomViewController)
        }
        
        container!.addSubview(bottomView)
        container!.addSubview(newView)
        
        let duration = self.transitionDuration(transitionContext)
        
        if (self.presenting) {
            let circularView = UIView()
            circularView.frame.size = CGSize(width: animationSize.width, height: animationSize.height)
            circularView.backgroundColor = self.animationColor
            circularView.center = animationPoint
            circularView.layer.cornerRadius = animationSize.height/2
            circularView.layer.masksToBounds = true
            circularView.alpha = 1.0
            circularView.tag = 764
            bottomViewController.view.addSubview(circularView)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                let scale:CGFloat = screenComp;
                circularView.transform = CGAffineTransformMakeScale(scale, scale)
                circularView.center = animationPoint
                }) { (Finished) -> Void in
                    UIView.animateWithDuration(duration,
                        delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
                        self.onStageMenuController(newViewController, fromViewController: bottomViewController)
                        }, completion: { finished in
                            transitionContext.completeTransition(true)
                            UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
                    })
            }
        } else {
            let circularView: UIView = bottomViewController.view.viewWithTag(764)!
            self.offStageMenuController(newViewController, fromViewController: bottomViewController)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                let scale:CGFloat = -screenComp;
                circularView.transform = CGAffineTransformMakeScale(1, 1)
                circularView.center = animationPoint
                }) { (Finished) -> Void in
                    circularView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
            }
        }
    }
    func offStage(amount: CGFloat) -> CGAffineTransform {
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    func offStageMenuController(menuViewController: UIViewController, fromViewController: UIViewController){
        menuViewController.view.alpha = 0
    }
    func onStageMenuController(menuViewController: UIViewController, fromViewController: UIViewController){
        menuViewController.view.alpha = 1
    }
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}


