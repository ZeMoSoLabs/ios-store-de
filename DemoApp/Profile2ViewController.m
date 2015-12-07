//
//  Profile2ViewController.m
//  DemoApp
//
//  Created by Praveen Yadav on 11/3/15.
//  Copyright © 2015 zemoso. All rights reserved.
//

#import "Profile2ViewController.h"
#import "ZeTarget.h"
#import "ShopViewController.h"
#import "AppDelegate.h"

@interface Profile2ViewController ()

@end

@implementation Profile2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textField.delegate=self;
    _text2.delegate=self;
    _text3.delegate=self;
    _text4.delegate=self;
    
    
    _textField.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"firstName"]?:@"John";
    _text2.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"lastName"]?:@"Doe";
    _text3.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"gender"]?:@"Male";
    _text4.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"DOB"]?:@"03/23/2015";
//    CGRect rect = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-50, [[UIScreen mainScreen] bounds].size.width, 50);
//    _gradView.frame = rect;
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = _gradView.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor lightGrayColor] CGColor], nil];
//    [_gradView.layer insertSublayer:gradient atIndex:0];
}


-(void)viewWillAppear:(BOOL)animated{
    [ZeTarget setCurrentScreen:self];
//    [_dobLabel setText:NSLocalizedString(@"dobLabel", nil)];
//    [_lnameLabel setText:NSLocalizedString(@"lName", nil)];
//    [_fnameLabel setText:NSLocalizedString(@"fName", nil)];
//    [_genderLabel setText:NSLocalizedString(@"genderLabel", nil)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag==0) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"firstName"];
        [ZeTarget logEventWithName:@"firstNameChanged"];
    }else if (textField.tag==1) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"lastName"];
    }else if (textField.tag==2) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"gender"];
    }else if (textField.tag==3) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"DOB"];
    }
    
    [textField resignFirstResponder];
    return YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [ZeTarget setUserFirstName:_textField.text];
    [ZeTarget setUserLastName:_text2.text];
    [ZeTarget setUserGender:_text3.text];
    
}
- (IBAction)showShopView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ShopViewController* shopViewController = [storyboard instantiateViewControllerWithIdentifier:@"shopView"];
    AppDelegate* appDel = [[UIApplication sharedApplication] delegate];
    appDel.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // tab item highlighted color
    
    [appDel.window makeKeyAndVisible];
    appDel.window.rootViewController =shopViewController;
}
- (IBAction)showPurchaseView:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ShopViewController* shopViewController = [storyboard instantiateViewControllerWithIdentifier:@"purchaseView"];
    AppDelegate* appDel = [[UIApplication sharedApplication] delegate];
    appDel.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // tab item highlighted color
    
    [appDel.window makeKeyAndVisible];
    appDel.window.rootViewController =shopViewController;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
