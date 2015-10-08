//
//  ProfileViewController.m
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _gradView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor lightGrayColor] CGColor], nil];
    [_gradView.layer insertSublayer:gradient atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.tag==0) {
        [[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"firstName"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
