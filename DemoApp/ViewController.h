//
//  ViewController.h
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *cardDetailsView;

@property (strong, nonatomic) IBOutlet UIButton *payNowButton;
@property (strong, nonatomic) IBOutlet UILabel *cardNumLabel;

@property (strong, nonatomic) IBOutlet UILabel *addrLabel;
@property (strong, nonatomic) IBOutlet UILabel *payLabel;

@property (strong, nonatomic) IBOutlet UILabel *compLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardDetLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardSubDetLabel;
@end

