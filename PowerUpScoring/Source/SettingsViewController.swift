//
//  SettingsViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 3/29/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
	@IBOutlet var blueSwitchLeft:UIImageView?
	@IBOutlet var blueSwitchRight:UIImageView?
	@IBOutlet var scaleLeft:UIImageView?
	@IBOutlet var scaleRight:UIImageView?
	@IBOutlet var redSwitchLeft:UIImageView?
	@IBOutlet var redSwitchRight:UIImageView?
	@IBOutlet var gameStringLabel:UILabel?
	@IBOutlet var startButton:UIButton?

	@IBAction func start(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("start",
											   ["gameString":GameState.getGameString()]);
	}
	
	@IBAction func randomize(sender:UIButton) {
		GameState.randomize();
		gameStringLabel?.text = "Alliance String:" + GameState.getGameString();
		redSwitchRight?.image = UIImage.init(named: GameState.isSwitchLeft ? "blue-unselected.png" : "red-unselected.png");
		blueSwitchRight?.image = redSwitchRight?.image!;
		redSwitchLeft?.image = UIImage.init(named: GameState.isSwitchLeft ? "red-unselected.png" : "blue-unselected.png");
		blueSwitchLeft?.image = redSwitchLeft?.image!;
		scaleLeft?.image = UIImage.init(named: GameState.isScaleLeft ? "red-unselected.png" : "blue-unselected.png");
		scaleRight?.image = UIImage.init(named: GameState.isScaleLeft ? "blue-unselected.png" : "red-unselected.png");
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		AppDelegate.manager.defaultSocket.on("start") { data, ack in
			GameState.setGameString(str: data[0] as! String);
			GameState.scaleState = 0;
			GameState.switchBlue = false;
			GameState.switchRed = false;
			self.startButton?.isEnabled = false;
			GameState.gameActive = true;
		};
		AppDelegate.manager.defaultSocket.on("end") { data, ack in
			self.startButton?.isEnabled = true;
			GameState.gameActive = false;
		};
        // Do any additional setup after loading the view.
    }
	
	deinit {
		AppDelegate.manager.defaultSocket.off("start");
		AppDelegate.manager.defaultSocket.off("end");
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
