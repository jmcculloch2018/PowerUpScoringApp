//
//  SettingsViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 3/29/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet var blueSwitchLeft:UIImageView?
	@IBOutlet var blueSwitchRight:UIImageView?
	@IBOutlet var scaleLeft:UIImageView?
	@IBOutlet var scaleRight:UIImageView?
	@IBOutlet var redSwitchLeft:UIImageView?
	@IBOutlet var redSwitchRight:UIImageView?
	@IBOutlet var gameStringLabel:UILabel?
	@IBOutlet var startButton:UIButton?
	@IBOutlet var redTeam1:UITextField?
	@IBOutlet var redTeam2:UITextField?
	@IBOutlet var redTeam3:UITextField?
	@IBOutlet var blueTeam1:UITextField?
	@IBOutlet var blueTeam2:UITextField?
	@IBOutlet var blueTeam3:UITextField?

	@IBAction func start(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("start",
											   ["gameString":GameState.getGameString()]);
	}
	
	@IBAction func reset(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("reset", [redTeam1?.text, redTeam2?.text, redTeam3?.text, blueTeam1?.text, blueTeam2?.text, blueTeam3?.text]);
	}
	
	@IBAction func randomize(sender:UIButton) {
		GameState.randomize();
		updateImages();
	}
	func updateImages() {
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
		AppDelegate.on(event: "reset", callback: {data in
			self.startButton?.isEnabled = true;
			self.updateImages();
		});
		AppDelegate.on(event: "start", callback: {data in
			GameState.setGameString(str: data[0] as! String);
			self.startButton?.isEnabled = false;
			GameState.gameActive = true;
		});
		AppDelegate.on(event: "end", callback: {data in
			GameState.gameActive = false;
		});
		GameState.randomize();
		self.updateImages();
		redTeam1?.delegate = self;
		redTeam2?.delegate = self;
		redTeam3?.delegate = self;
		blueTeam1?.delegate = self;
		blueTeam2?.delegate = self;
		blueTeam3?.delegate = self;

        // Do any additional setup after loading the view.
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
