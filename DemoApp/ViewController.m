//
//  ViewController.m
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZeTarget.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_cardDetailsView.layer setBorderWidth:1];
    [_cardDetailsView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_cardDetailsView.layer setCornerRadius:4.0f];
    [[NSUserDefaults standardUserDefaults] setObject:@"purchased" forKey:@"purchase"];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [ZeTarget setCurrentScreen:self];
    [_addrLabel setText:NSLocalizedString(@"AddrLabel", nil)];
    [_payLabel setText:NSLocalizedString(@"payLabel", nil)];
    [_payNowButton setTitle:NSLocalizedString(@"payNowLabel", nil) forState:UIControlStateNormal];
    [_compLabel setText:NSLocalizedString(@"compLabel", nil)];
    [_cardDetLabel setText:NSLocalizedString(@"cardDetLabel", nil)];
    [_cardSubDetLabel setText:NSLocalizedString(@"cardDetSubLabel", nil)];
}
- (IBAction)payNowTapped:(id)sender {
    // logs purchase completed event to sdk. Amounted is randomly generated for this demo app. Actual values in your app can be used to segment users.
    [ZeTarget logPurchaseWithGrandTotal:@(arc4random_uniform(500))];
    [self performSegueWithIdentifier:@"payNowSegue" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
