#QZCircleSegue

QZCircleSegue is written in Swift and it is a beatiful transition between circular-shapped buttons and your ViewController.
With just a few super-simple steps you can setup your settings according to your app.

What it does?

![Example](https://www.dribba.com/external/QZCircleSegue/example.gif)

##Requirements and Dependencies
- Swift Language (>= 1.2)
- iOS >= 8.0

##Installation

####Manual install:
- Copy `QZCircleSegue.swift` into your project.

##Usage

### Setting everything up on your Storyboard

Pre. Have a Storyboard file with buttons and controllers

1. Create an Action Segue from your UIButton to your View Controller. Set it as a `'Present Modally'` segue and set an `Identifier`*(if needed)*.

![](https://www.dribba.com/external/QZCircleSegue/connect.jpg)

2. On your `Origin View Controller` *(where your buttons are placed in)* add the following method.
	
    		@IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
   				self.dismissViewControllerAnimated(true, completion: nil)
			}
3. Connect a Back element to the `Exit Segue` as shown in the image.

![](https://www.dribba.com/external/QZCircleSegue/exit.jpg)

### Setting everything up on your origin's Controller

Once everything is configured on your Storyboard file, you'll need to setup your `QZCircleSegue` instance in your origin's Controller.

1. Create and configure a `QZCircleSegue` instance to fit your settings.

    			...
    		var transition = QZCircleSegue()
    		...
		 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        		let destinationViewController = segue.destinationViewController as! NewViewController
        		self.transition.animationChild = buttonOne
        		self.transition.animationColor = UIColor.redColor()
        		self.transition.fromViewController = self
        		self.transition.toViewController = destinationViewController
        		destinationViewController.transitioningDelegate = transition
			}
2. *Optional* Check the DEMO APP to see how to configure different settings for different buttons.


## License

Licensed under MIT. A copy can be found inside this folder.
