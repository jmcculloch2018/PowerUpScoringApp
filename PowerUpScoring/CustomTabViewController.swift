//
//  CustomTabViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 5/24/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class CustomTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		AppDelegate.on(event: "disconnect", callback: {data in
			self.performSegue(withIdentifier: "showConnection", sender: nil);
		});
		AppDelegate.on(event: "connect", callback: {data in
			self.presentedViewController?.dismiss(animated: true, completion: nil);
		});
    }
	
	override func viewDidAppear(_ animated: Bool) {
		self.performSegue(withIdentifier: "showConnection", sender: nil);
	}
	
	@IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
