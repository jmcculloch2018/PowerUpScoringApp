//
//  RefereeViewController.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 5/1/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class RefereeViewController: UIViewController {
	@IBOutlet var finalizeMatchButton:UIButton?
	@IBOutlet var redClimbsLabel:UILabel?
	@IBOutlet var blueClimbsLabel:UILabel?
	@IBOutlet var redParksLabel:UILabel?
	@IBOutlet var blueParksLabel:UILabel?
	@IBOutlet var redCrossLabel:UILabel?
	@IBOutlet var blueCrossLabel:UILabel?
	
	@IBOutlet var redClimbsStepper:UIStepper?
	@IBOutlet var blueClimbsStepper:UIStepper?
	@IBOutlet var redCrossStepper:UIStepper?
	@IBOutlet var blueCrossStepper:UIStepper?
	@IBOutlet var redParksStepper:UIStepper?
	@IBOutlet var blueParksStepper:UIStepper?
	
	@IBAction func finalizeMatch(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("finalize");
	}

	@IBAction func redFoul(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("foul", [true, false])
	}
	@IBAction func blueFoul(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("foul", [false, false])
	}
	@IBAction func redTech(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("foul", [true, true])
	}
	@IBAction func blueTech(sender:UIButton) {
		AppDelegate.manager.defaultSocket.emit("foul", [false, true])
	}
	
	@IBAction func redClimbsChanged(sender:UIStepper) {
		let redClimbs = Int(sender.value);
		redClimbsLabel?.text = "# Climbs: \(redClimbs)";
		AppDelegate.manager.defaultSocket.emit("updateClimbs", [true, redClimbs]);
	}
	
	@IBAction func blueClimbsChanged(sender:UIStepper) {
		let blueClimbs = Int(sender.value);
		blueClimbsLabel?.text = "# Climbs: \(blueClimbs)";
		AppDelegate.manager.defaultSocket.emit("updateClimbs", [false, blueClimbs]);

	}
	
	@IBAction func redParksChanged(sender:UIStepper) {
		let redParks = Int(sender.value);
		redParksLabel?.text = "# Parks: \(redParks)";
		AppDelegate.manager.defaultSocket.emit("updateParks", [true, redParks]);
	}
	
	@IBAction func blueParksChanged(sender:UIStepper) {
		let blueParks = Int(sender.value);
		blueParksLabel?.text = "# Parks: \(blueParks)";
		AppDelegate.manager.defaultSocket.emit("updateParks", [false, blueParks]);
		
	}
	
	@IBAction func redCrossChanged(sender:UIStepper) {
		let redCrosses = Int(sender.value);
		redCrossLabel?.text = "# Auto Cross: \(redCrosses)";
		AppDelegate.manager.defaultSocket.emit("updateAutoCrosses", [true, redCrosses]);
	}
	@IBAction func blueCrossChanged(sender:UIStepper) {
		let blueCrosses = Int(sender.value);
		blueCrossLabel?.text = "# Auto Cross: \(blueCrosses)";
		AppDelegate.manager.defaultSocket.emit("updateAutoCrosses", [false, blueCrosses]);
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		
		AppDelegate.on(event: "reset", callback: {data in
			self.redCrossLabel?.text = "# Auto Cross: 0";
			self.redCrossStepper?.value = 0;
			self.blueCrossLabel?.text = "# Auto Cross: 0";
			self.blueCrossStepper?.value = 0;
			self.redClimbsLabel?.text = "# Climbs: 0";
			self.redClimbsStepper?.value = 0;
			self.blueClimbsLabel?.text = "# Climbs: 0";
			self.blueClimbsStepper?.value = 0;
			self.redParksLabel?.text = "# Parks: 0";
			self.redParksStepper?.value = 0;
			self.blueParksLabel?.text = "# Parks: 0";
			self.blueParksStepper?.value = 0;
		});
			
		AppDelegate.on(event: "updateAutoCrosses", callback: {data in
			let isRed = data[0] as! Bool;
			if (isRed) {
				let redCrosses = data[1] as! Int;
				self.redCrossLabel?.text = "# Auto Cross: \(redCrosses)";
				self.redCrossStepper?.value = Double(redCrosses);
			} else {
				let blueCrosses = data[1] as! Int;
				self.blueCrossLabel?.text = "# Auto Cross: \(blueCrosses)";
				self.blueCrossStepper?.value = Double(blueCrosses);
			}
		});
		
		AppDelegate.on(event: "updateClimbs", callback: {data in
			let isRed = data[0] as! Bool;
			if (isRed) {
				let redClimbs = data[1] as! Int;
				self.redClimbsLabel?.text = "# Climbs: \(redClimbs)";
				self.redClimbsStepper?.value = Double(redClimbs);
			} else {
				let blueClimbs = data[1] as! Int;
				self.blueClimbsLabel?.text = "# Climbs: \(blueClimbs)";
				self.blueClimbsStepper?.value = Double(blueClimbs);
			}
		});
		
		AppDelegate.on(event: "updateParks", callback: {data in
			let isRed = data[0] as! Bool;
			if (isRed) {
				let redParks = data[1] as! Int;
				self.redParksLabel?.text = "# Parks: \(redParks)";
				self.redParksStepper?.value = Double(redParks);
			} else {
				let blueParks = data[1] as! Int;
				self.blueParksLabel?.text = "# Parks: \(blueParks)";
				self.blueParksStepper?.value = Double(blueParks);
			}
		});

        // Do any additional setup after loading the view.
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
