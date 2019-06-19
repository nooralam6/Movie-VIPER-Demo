//
//  AppDelegate.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let movieList = MovieListModule()
        let navigationController = UINavigationController(rootViewController: movieList.view)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        initializeNetwork()
        return true
    }

    
    //MARK:-  Network reachability
    
    private func initializeNetwork() {
        
        do {
            Network.reachability = try Reachability(hostname: "www.google.com")
            do {
                try Network.reachability?.start()
            } catch let error as Network.Error {
                print(error)
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .flagsChanged, object: Network.reachability)
    }
    
    @objc func statusManager(_ notification: NSNotification) {
        // do your work here once network flag changes
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

