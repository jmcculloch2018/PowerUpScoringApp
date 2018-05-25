//
//  HumanPlayerViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 4/30/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class HumanPlayerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	
	
	@IBOutlet var boost1:UIButton?
	@IBOutlet var boost2:UIButton?
	@IBOutlet var boost3:UIButton?
	@IBOutlet var force1:UIButton?
	@IBOutlet var force2:UIButton?
	@IBOutlet var force3:UIButton?
	@IBOutlet var levitate1:UIButton?
	@IBOutlet var levitate2:UIButton?
	@IBOutlet var levitate3:UIButton?
	@IBOutlet var boost:UIImageView?
	@IBOutlet var force:UIImageView?
	@IBOutlet var levitate:UIImageView?
	
	var isRed = false;
	
	
	var cubeColor = UIImage(imageLiteralResourceName: "power-cube.png")
	var cubeGray = UIImage(imageLiteralResourceName: "power-cube-gray.png")
	var boostColor = UIImage(imageLiteralResourceName: "boost.png")
	var boostGray = UIImage(imageLiteralResourceName: "boost-gray.png")
	var forceColor = UIImage(imageLiteralResourceName: "force.png")
	var forceGray = UIImage(imageLiteralResourceName: "force-gray.png")
	var levitateColor = UIImage(imageLiteralResourceName: "levitate.png")
	var levitateGray = UIImage(imageLiteralResourceName: "levitate-gray.png")

	// select red / blue
	@IBOutlet weak var pickerTextField : UITextField!
	
	let options = ["Red", "Blue"]
	let colors = [UIColor(red: 1, green: 77.0 / 255, blue: 38.0 / 255, alpha: 1),
				  UIColor(red: 109.0 / 255, green: 166.0 / 255, blue: 1, alpha: 1)]

	
	// Sets number of columns in picker view
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	// Sets the number of rows in the picker view
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
	return options.count
	}
	
	// This function sets the text of the picker view to the content of the "salutations" array
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
	return options[row]
	}
	
	// When user selects an option, this function will set the text of the text field to reflect
	// the selected option.
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		pickerTextField.text = options[row]
		pickerTextField.backgroundColor = colors[row];
		pickerTextField.resignFirstResponder()
		isRed = row == 0;
	}
	
	
	@IBAction func boost1(sender:UIButton) {
		boost1?.setImage(cubeColor, for: UIControlState.normal)
		boost1?.setImage(cubeColor, for: UIControlState.selected)
		boost?.image = boostColor;
		AppDelegate.manager.defaultSocket.emit("boost", [isRed, 1]);

	}
	@IBAction func boost2(sender:UIButton) {
		boost1?.setImage(cubeColor, for: UIControlState.normal)
		boost1?.setImage(cubeColor, for: UIControlState.selected)
		boost2?.setImage(cubeColor, for: UIControlState.normal)
		boost2?.setImage(cubeColor, for: UIControlState.selected)
		boost?.image = boostColor;
		AppDelegate.manager.defaultSocket.emit("boost", [isRed, 2]);

	}
	@IBAction func boost3(sender:UIButton) {
		boost1?.setImage(cubeColor, for: UIControlState.normal)
		boost1?.setImage(cubeColor, for: UIControlState.selected)
		boost2?.setImage(cubeColor, for: UIControlState.normal)
		boost2?.setImage(cubeColor, for: UIControlState.selected)
		boost3?.setImage(cubeColor, for: UIControlState.normal)
		boost3?.setImage(cubeColor, for: UIControlState.selected)
		boost?.image = boostColor;
		AppDelegate.manager.defaultSocket.emit("boost", [isRed, 3]);

	}
	
	@IBAction func force1(sender:UIButton) {
		force1?.setImage(cubeColor, for: UIControlState.normal)
		force1?.setImage(cubeColor, for: UIControlState.selected)
		force?.image = forceColor;
		AppDelegate.manager.defaultSocket.emit("force", [isRed, 1]);

	}
	@IBAction func force2(sender:UIButton) {
		force1?.setImage(cubeColor, for: UIControlState.normal)
		force1?.setImage(cubeColor, for: UIControlState.selected)
		force2?.setImage(cubeColor, for: UIControlState.normal)
		force2?.setImage(cubeColor, for: UIControlState.selected)
		force?.image = forceColor;
		AppDelegate.manager.defaultSocket.emit("force", [isRed, 2]);
	}
	@IBAction func force3(sender:UIButton) {
		force1?.setImage(cubeColor, for: UIControlState.normal)
		force1?.setImage(cubeColor, for: UIControlState.selected)
		force2?.setImage(cubeColor, for: UIControlState.normal)
		force2?.setImage(cubeColor, for: UIControlState.selected)
		force3?.setImage(cubeColor, for: UIControlState.normal)
		force3?.setImage(cubeColor, for: UIControlState.selected)
		force?.image = forceColor;
		AppDelegate.manager.defaultSocket.emit("force", [isRed, 3]);

	}
	@IBAction func levitate1(sender:UIButton) {
		levitate1?.setImage(cubeColor, for: UIControlState.normal)
		levitate1?.setImage(cubeColor, for: UIControlState.selected)
		AppDelegate.manager.defaultSocket.emit("levitate", [isRed, 1]);

	}
	@IBAction func levitate2(sender:UIButton) {
		levitate1?.setImage(cubeColor, for: UIControlState.normal)
		levitate1?.setImage(cubeColor, for: UIControlState.selected)
		levitate2?.setImage(cubeColor, for: UIControlState.normal)
		levitate2?.setImage(cubeColor, for: UIControlState.selected)
		AppDelegate.manager.defaultSocket.emit("levitate", [isRed, 2]);

	}
	@IBAction func levitate3(sender:UIButton) {
		levitate1?.setImage(cubeColor, for: UIControlState.normal)
		levitate1?.setImage(cubeColor, for: UIControlState.selected)
		levitate2?.setImage(cubeColor, for: UIControlState.normal)
		levitate2?.setImage(cubeColor, for: UIControlState.selected)
		levitate3?.setImage(cubeColor, for: UIControlState.normal)
		levitate3?.setImage(cubeColor, for: UIControlState.selected)
		levitate?.image = levitateColor;
		AppDelegate.manager.defaultSocket.emit("levitate", [isRed, 3]);

	}
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let pickerView = UIPickerView()
		pickerView.delegate = self
		pickerTextField.inputView = pickerView
		
		AppDelegate.on(event: "reset", callback: {data in
			self.reset()
		});
		
		reset();
		
		
		

        // Do any additional setup after loading the view.
    }
	
	func reset() {
		
		levitate1?.setImage(cubeGray, for: UIControlState.normal)
		levitate1?.setImage(cubeGray, for: UIControlState.selected)
		levitate2?.setImage(cubeGray, for: UIControlState.normal)
		levitate2?.setImage(cubeGray, for: UIControlState.selected)
		levitate3?.setImage(cubeGray, for: UIControlState.normal)
		levitate3?.setImage(cubeGray, for: UIControlState.selected)
		levitate?.image = levitateGray
		
		force1?.setImage(cubeGray, for: UIControlState.normal)
		force1?.setImage(cubeGray, for: UIControlState.selected)
		force2?.setImage(cubeGray, for: UIControlState.normal)
		force2?.setImage(cubeGray, for: UIControlState.selected)
		force3?.setImage(cubeGray, for: UIControlState.normal)
		force3?.setImage(cubeGray, for: UIControlState.selected)
		force?.image = forceGray
		
		boost1?.setImage(cubeGray, for: UIControlState.normal)
		boost1?.setImage(cubeGray, for: UIControlState.selected)
		boost2?.setImage(cubeGray, for: UIControlState.normal)
		boost2?.setImage(cubeGray, for: UIControlState.selected)
		boost3?.setImage(cubeGray, for: UIControlState.normal)
		boost3?.setImage(cubeGray, for: UIControlState.selected)
		boost?.image = boostGray;
	}
	

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
