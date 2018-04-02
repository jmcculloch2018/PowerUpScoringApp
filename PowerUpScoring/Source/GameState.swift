//
//  GameState.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 3/29/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit

class GameState: NSObject {
	static var isSwitchLeft = false, isScaleLeft = false;
	static var switchRed = false, switchBlue = false;
	static var scaleState = 0; // 1 = red, -1 = blue
	static func randomize() {
		let rand = arc4random();
		isSwitchLeft = rand & 0x01 != 0;
		isScaleLeft = rand & 0x02 != 0;
	}
	static func getGameString() -> String {
		let switchStr = isSwitchLeft ? "L" : "R";
		let scaleStr = isScaleLeft ? "L" : "R";
		return switchStr + scaleStr + switchStr;
	}
}
