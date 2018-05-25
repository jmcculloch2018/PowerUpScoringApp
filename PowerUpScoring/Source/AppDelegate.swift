//
//  AppDelegate.swift
//  PowerUpScoring
//
//  Created by Jeremy McCulloch on 3/28/18.
//  Copyright © 2018 Jeremy McCulloch. All rights reserved.
//

import UIKit
import SocketIO
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	public static var manager:SocketManager = SocketManager(socketURL: URL(string: "http://localhost:3000")!, config: [.log(true), .compress]);
	public static var functions = [String:(([Any]) -> Void)]();

	static func attemptConnection(ip:String) {
		manager.disconnect();
		manager = SocketManager(socketURL: URL(string: "http://" + ip + ":3000")!, config: [.log(true), .compress])
		AppDelegate.manager.defaultSocket.connect();
		for (event, callback) in functions {
			manager.defaultSocket.on(event) {data, ack in
				callback(data);
			};
		}
	}
	
	static func on(event:String, callback:@escaping([Any]) -> Void) {
		if (functions[event] == nil) {
			functions[event] = callback;
		} else {
			let oldFunc = functions[event]!;
			functions[event] = { data in
				oldFunc(data);
				callback(data);
				
			}
		}
		manager.defaultSocket.on(event) {data, ack in
			callback(data);
		};
	}
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		AppDelegate.attemptConnection(ip: "localhost");
		AppDelegate.on(event: "reset", callback: {data in
			GameState.reset();
		});
		return true
	}
	
	

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

