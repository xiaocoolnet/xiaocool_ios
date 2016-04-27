 //
//  AppDelegate.swift
//  校酷网络
//
//  Created by zhang on 16/3/18.
//  Copyright © 2016年 xiaocool. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        为闪屏腾出时间
//         NSThread.sleepForTimeInterval(2.0)
       self.loginCheck()
        
//        把返回按钮的back移走
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: UIBarMetrics.Default)
//        设置导航栏的背景色
        UINavigationBar.appearance().barTintColor = UIColor(red: 0 / 255.0, green: 191.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
//        设置返回按钮的颜色
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
//        设置导航栏中标题的颜色和大小
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(20)]
//        标签栏标题的位置
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0, -3)
//        标签栏标题的颜色和大小
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blackColor(),NSFontAttributeName:UIFont.systemFontOfSize(12)], forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 56/255.0, green: 136.0/255.0, blue: 255.0/255.0, alpha: 1),NSFontAttributeName:UIFont.systemFontOfSize(12)], forState: .Selected)
        
        UITabBar.appearance().translucent = false
        return true
    }
    
    func loginCheck(){
//        判断是否有用户信息，如果有直接登录，否则跳转到登录界面
        let userid = NSUserDefaults.standardUserDefaults()
        var segueId = "MainView"
        if((userid.valueForKey("userid") == nil) || (userid.valueForKey("userid")?.length == 0 )){
            segueId = "LoginView"
            self.window?.rootViewController = self.window?.rootViewController?.storyboard?.instantiateViewControllerWithIdentifier(segueId)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBarController = storyboard.instantiateViewControllerWithIdentifier(segueId) as! UITabBarController
            let tabBarItem = tabBarController.tabBar.items![2]
            tabBarItem.badgeValue = nil
            self.window?.rootViewController = tabBarController
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

