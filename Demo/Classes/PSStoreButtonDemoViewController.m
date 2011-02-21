//
//  PSStoreButtonDemoViewController.m
//  PSStoreButtonDemo
//
//  Created by Peter Steinberger on 17.02.11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import "PSStoreButtonDemoViewController.h"

@implementation PSStoreButtonDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  storeButton1 = [[PSStoreButton storeButton] retain];
  storeButton1.buttonDelegate = self;
  storeButton1.buttonData = [PSStoreButtonData dataWithLabel:@"3,99 $" colors:[PSStoreButton appStoreGreenColor] enabled:YES];
  storeButton1.tag = 1; // mark button for delegate
  storeButton1.frame = CGRectMake(20, 100, 100, 25);
  [self.view addSubview:storeButton1];
  
  storeButton2 = [[PSStoreButton storeButton] retain];
  storeButton2.buttonDelegate = self;
  storeButton2.buttonData = [PSStoreButtonData dataWithLabel:@"9,99 $" colors:[PSStoreButton appStoreGreenColor] enabled:YES];
  storeButton2.customPadding = CGPointMake(10, 10);
  storeButton2.frame = CGRectMake(0, 0, 100, 25);
  storeButton2.tag = 2; // mark button for delegate
  [self.view addSubview:storeButton2];
  [storeButton2 alignToSuperview];
  
  NSArray *customColor = [NSArray arrayWithObjects:(id)
                          [UIColor redColor].CGColor,
                          [UIColor orangeColor].CGColor, nil];
  
  storeButton3 = [[PSStoreButton storeButton] retain];
  storeButton3.buttonDelegate = self;
  storeButton3.buttonData = [PSStoreButtonData dataWithLabel:@"Custom" colors:customColor enabled:YES];
  storeButton3.tag = 3; // mark button for delegate
  storeButton3.frame = CGRectMake(20, 200, 100, 25);
  [self.view addSubview:storeButton3];
}

- (void)didReceiveMemoryWarning {
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}


- (void)dealloc {
  [storeButton1 release];
  [storeButton2 release];
  [storeButton3 release];
  [super dealloc];
}

- (void)resetButton1 {
  [storeButton1 setButtonData:[PSStoreButtonData dataWithLabel:@"3,99 $" colors:[PSStoreButton appStoreGreenColor] enabled:YES] animated:YES];
}

// PSStoreButtonDelegate
- (void)storeButtonFired:(PSStoreButton *)button {
  if(button.tag == 1 || button.tag == 2) {
    if ([button.buttonData.label hasSuffix:@"$"]) {
      [button setButtonData:[PSStoreButtonData dataWithLabel:@"BUY NOW" colors:[PSStoreButton appStoreGreenColor] enabled:YES] animated:YES];
    }else if ([button.buttonData.label isEqualToString:@"BUY NOW"]) {
      [button setButtonData:[PSStoreButtonData dataWithLabel:@"INSTALLING" colors:[PSStoreButton appStoreGrayColor] enabled:NO] animated:YES];
      [self performSelector:@selector(resetButton1) withObject:nil afterDelay:2.0];
    }
  }else if (button.tag == 3) {
    if ([button.buttonData.label hasSuffix:@"Custom"]) {
      [button setButtonData:[PSStoreButtonData dataWithLabel:@"Max Width can be defined" colors:[PSStoreButton appStoreGreenColor] enabled:YES] animated:YES];
    }else {
      [button setButtonData:[PSStoreButtonData dataWithLabel:@"Custom" colors:[PSStoreButton appStoreGrayColor] enabled:YES] animated:YES];
    }
  }
}

@end
