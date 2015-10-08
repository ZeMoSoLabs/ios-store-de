//
//  ShopViewController.h
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *iphoneQty;

@property (strong, nonatomic) IBOutlet UILabel *stealLikeBookQty;

@property (strong, nonatomic) IBOutlet UILabel *nikonCamQty;

@property (strong, nonatomic) IBOutlet UILabel *subTotal;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelStrike1;
@property (strong, nonatomic) IBOutlet UILabel *labelStrike2;
@property (strong, nonatomic) IBOutlet UILabel *labelStrike3;

@property (strong, nonatomic) IBOutlet UIView *tabView;
@property (strong, nonatomic) IBOutlet UILabel *badgeLabel;

@property (strong, nonatomic) IBOutlet UILabel *shippingAmountLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIView *actionViewLabel;

@end
