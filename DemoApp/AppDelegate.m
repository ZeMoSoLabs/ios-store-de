//
//  AppDelegate.m
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import "AppDelegate.h"
#import "ShopViewController.h"
#import "ZeTarget.h"


@interface AppDelegate (){

}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // Replace your api key with "ZemosoL" to get started
    [ZeTarget setZetargetUrl:@"http://devapi.zetarget.com"];
    [ZeTarget instantiateAPIInDebugModeWithKey:@"ZemosoL"];
    [[NSUserDefaults standardUserDefaults] setObject:@"not Purchase" forKey:@"purchase"];
    
//
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"loginId"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ShopViewController* shopViewController = [storyboard instantiateViewControllerWithIdentifier:@"shopView"];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        // tab item highlighted color
        
        [self.window makeKeyAndVisible];
        self.window.rootViewController =shopViewController;
        //Register for push notifications using zetarget SDK method.
        [ZeTarget registerForPushNotifications];
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    //Send the push token recieved to zetarget SDK
    [ZeTarget registerPushToken:[NSString stringWithFormat:@"%@", deviceToken]];
    NSLog(@"devvice token:%@",deviceToken);
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
}
-(void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler{
    [ZeTarget handlePushNotificationActionWithIdentifier:identifier forRemoteNotification:userInfo];
    completionHandler();
}

@end
