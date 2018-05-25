//
//  ConnectionViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 5/23/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet var ipAddress:UITextField?;
	@IBAction func connect(sender:UIButton) {
		AppDelegate.attemptConnection(ip:ipAddress!.text!);
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			let fileURL = dir.appendingPathComponent("ip.txt");
			do {
				try ipAddress?.text!.write(to: fileURL, atomically: false, encoding: .utf8)
			}
			catch {/* error handling here */}
		}

	}
    override func viewDidLoad() {
        super.viewDidLoad()
		ipAddress?.delegate = self;
		if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
			let fileURL = dir.appendingPathComponent("ip.txt");
			do {
				ipAddress?.text =  try String(contentsOf: fileURL, encoding: .utf8)
			}
			catch {/* error handling here */}
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		self.view.endEditing(true)
		return false
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
