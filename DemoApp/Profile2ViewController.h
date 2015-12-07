//
//  Profile2ViewController.h
//  DemoApp
//
//  Created by Praveen Yadav on 11/3/15.
//  Copyright © 2015 zemoso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile2ViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextField *text2;
@property (strong, nonatomic) IBOutlet UITextField *text3;

@property (strong, nonatomic) IBOutlet UITextField *text4;
@property (strong, nonatomic) IBOutlet UIView *gradView;
@property (strong, nonatomic) IBOutlet UILabel *dobLabel;
@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UILabel *lnameLabel;
@property (strong, nonatomic) IBOutlet UILabel *fnameLabel;
@end
