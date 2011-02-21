//
//  PSStoreButtonDemoAppDelegate.h
//  PSStoreButtonDemo
//
//  Created by Peter Steinberger on 17.02.11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSStoreButtonDemoViewController;

@interface PSStoreButtonDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PSStoreButtonDemoViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PSStoreButtonDemoViewController *viewController;

@end

