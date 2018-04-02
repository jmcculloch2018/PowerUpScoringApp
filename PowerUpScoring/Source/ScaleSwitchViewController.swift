//
//  ScaleSwitchViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 3/29/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class ScaleSwitchViewController: UIViewController {
	@IBOutlet var redSwitchLeft:UIButton?
	@IBOutlet var redSwitchRight:UIButton?
	@IBOutlet var blueSwitchLeft:UIButton?
	@IBOutlet var blueSwitchRight:UIButton?
	@IBOutlet var scaleLeft:UIButton?
	@IBOutlet var scaleRight:UIButton?
	@IBOutlet var scaleNeutral:UIButton?;
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setScaleState(nScaleState: GameState.scaleState);
		setSwitchBlue(bSwitchBlue: GameState.switchBlue)
		setSwitchRed(bSwitchRed: GameState.switchRed);
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setScaleState(nScaleState: GameState.scaleState);
		setSwitchBlue(bSwitchBlue: GameState.switchBlue)
		setSwitchRed(bSwitchRed: GameState.switchRed);
	}
	
	@IBAction func redSwitchLeft(sender:UIButton) {
		setSwitchRed(bSwitchRed: GameState.isSwitchLeft);
	}
	@IBAction func redSwitchRight(sender:UIButton) {
		setSwitchRed(bSwitchRed: !GameState.isSwitchLeft);
	}
	@IBAction func blueSwitchLeft(sender:UIButton) {
		setSwitchBlue(bSwitchBlue: !GameState.isSwitchLeft)
	}
	@IBAction func blueSwitchRight(sender:UIButton) {
		setSwitchBlue(bSwitchBlue: GameState.isSwitchLeft)
	}
	@IBAction func scaleLeft(sender:UIButton) {
		setScaleState(nScaleState: GameState.isScaleLeft ? 1 : -1)
	}
	@IBAction func scaleRight(sender:UIButton) {
		setScaleState(nScaleState: GameState.isScaleLeft ? -1 : 1)
	}
	@IBAction func scaleMiddle(sender:UIButton) {
		setScaleState(nScaleState: 0)
	}
	func setSwitchRed(bSwitchRed:Bool) { // close side
		GameState.switchRed = bSwitchRed;
		let coloredButton = GameState.isSwitchLeft ? redSwitchLeft! : redSwitchRight!;
		let neutralButton = GameState.isSwitchLeft ? redSwitchRight! : redSwitchLeft!;
		coloredButton.setBackgroundImage(UIImage.init(named:bSwitchRed ? "red-selected.png" : "red-unselected.png" ), for: UIControlState.normal);
		neutralButton.setBackgroundImage(UIImage.init(named:bSwitchRed ? "gray-unselected.png" : "gray-selected.png" ), for: UIControlState.normal);
	}
	
	func setSwitchBlue(bSwitchBlue:Bool) -> Void { // far side
		GameState.switchBlue = bSwitchBlue;
		let coloredButton = GameState.isSwitchLeft ? blueSwitchRight! : blueSwitchLeft!;
		let neutralButton = GameState.isSwitchLeft ? blueSwitchLeft! : blueSwitchRight!;
		coloredButton.setBackgroundImage(UIImage.init(named:bSwitchBlue ? "blue-selected.png" : "blue-unselected.png" ), for: UIControlState.normal);
		neutralButton.setBackgroundImage(UIImage.init(named:bSwitchBlue ? "gray-unselected.png" : "gray-selected.png" ), for: UIControlState.normal);
	}
	
	func setScaleState(nScaleState:Int) -> Void {
		GameState.scaleState = nScaleState;
		let redButton = GameState.isScaleLeft ? scaleLeft! : scaleRight!;
		let blueButton = GameState.isScaleLeft ? scaleRight! : scaleLeft!;
		redButton.setBackgroundImage(UIImage.init(named:(nScaleState == 1) ? "red-selected.png" : "red-unselected.png" ), for: UIControlState.normal);
		blueButton.setBackgroundImage(UIImage.init(named:(nScaleState == -1) ? "blue-selected.png" : "blue-unselected.png" ), for: UIControlState.normal);
		scaleNeutral!.setBackgroundImage(UIImage.init(named:(nScaleState == 0) ? "gray-selected.png" : "gray-unselected.png" ), for: UIControlState.normal);
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
