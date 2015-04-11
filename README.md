# QZCircleSegue

Custom Segue developed in Swift for transition between circular-shapped buttons and UIViewControllers

![Example](https://www.dribba.com/external/QZCircleSegue/example.gif)


**Installation**

1) Drop the QZCircleSegue.swift file into your project 

**How to use it**

After having your desired Interface with your buttons and your View Controllers...

1) Connect the Button to your destination View Controller and set it as 'Present Modally' (set a name to the segue if desired)

![Connect to the EXIT Segue](https://www.dribba.com/external/QZCircleSegue/connect.jpg "Connect to the EXIT Segue")

2) Add the following method to your origin's View Controller

	@IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
   		self.dismissViewControllerAnimated(true, completion: nil)
	}

3) Connect the back button on your destination's View Controller to the EXIT segue

![Connect to the EXIT Segue](https://www.dribba.com/external/QZCircleSegue/exit.jpg "Connect to the EXIT Segue")

4) Configure the transition manager attributes as shown on the Demo app

5) Done!

**Transition Manager Settings**

   animationDuration: Animation's duration in seconds (default 0.2s)
   animationColor: Animation's main color (default white)
   animationChild: Animation's origin button, that's the button from where the animation will take place
   fromViewController: Origin
   toViewController: Destination
    



