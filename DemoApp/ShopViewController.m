//
//  ShopViewController.m
//  DemoApp
//
//  Created by Praveen Yadav on 6/30/15.
//  Copyright (c) 2015 zemoso. All rights reserved.
//

#import "ShopViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ZeTarget.h"
#import "Profile2ViewController.h"

@interface ShopViewController ()
{
    int iphone;
    int book;
    int nikon;
    float iphoneRate;
    float bookRate;
    float nikonRate;
}
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    iphone=0;
    book=0;
    nikon=0;
    
    iphoneRate= 645.99;
    bookRate=15.50;
    nikonRate=60.50;
    
    // Do any additional setup after loading the view.
}
-(void)setTextsForLabels{
    [_bookDescLabel setText:NSLocalizedString(@"itemLabel2", nil)];
    [_nikonDescLabel setText:NSLocalizedString(@"itemLabel3", nil)];
    [_iphoneDescLabel setText:NSLocalizedString(@"itemLabel1", nil)];
    
    [_totLabel setText:NSLocalizedString(@"totalLabel", nil)];
    [_subTotalLabel setText:NSLocalizedString(@"subTotalLabel", nil)];
    [_shipLabel setText:NSLocalizedString(@"Shipping", nil)];
    [_shopButtonLabel setText:NSLocalizedString(@"shopButtonLabel", nil)];
    [_moreButtonLabel setText:NSLocalizedString(@"moreButtonLabel", nil)];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [ZeTarget setCurrentScreen:self];
    
    [self setTextsForLabels];
    
    UIActivityIndicatorView* spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = [[[UIApplication sharedApplication] keyWindow] center];
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    [_iphoneQty.layer setBorderWidth:1];
    [_iphoneQty.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_iphoneQty.layer setCornerRadius:4.0f];
    [_iphoneQty setText:@"00"];
    
    
    [_stealLikeBookQty.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_stealLikeBookQty.layer setBorderWidth:1];
    [_stealLikeBookQty.layer setCornerRadius:4.0f];
    [_stealLikeBookQty setText:@"00"];
    
    [_nikonCamQty.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_nikonCamQty.layer setBorderWidth:1];
    [_nikonCamQty.layer setCornerRadius:4.0f];
    [_nikonCamQty setText:@"00"];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"purchase"] isEqualToString:@"purchased"]) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"485", nil) message:@"Thank you for purchasing with us" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        [[NSUserDefaults standardUserDefaults] setObject:@"not Purchase" forKey:@"purchase"];
        
    }
    NSAttributedString * title1 =
    [[NSAttributedString alloc] initWithString:@"$699.99"
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [_labelStrike1 setAttributedText:title1];
    NSAttributedString * title2 =
    [[NSAttributedString alloc] initWithString:@"$20.00"
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [_labelStrike2 setAttributedText:title2];
    NSAttributedString * title3 =
    [[NSAttributedString alloc] initWithString:@"$121.90"
                                    attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle)}];
    [_labelStrike3 setAttributedText:title3];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _tabView.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor lightGrayColor] CGColor], nil];
    [_tabView.layer insertSublayer:gradient atIndex:0];
    
    [_badgeLabel.layer setCornerRadius:7.5f];
    [_badgeLabel.layer setMasksToBounds:YES];
    [_badgeLabel setText:@"0"];
    [_badgeLabel setHidden:YES];
    [_actionButton.layer setZPosition:1000];
    [_badgeLabel.layer setZPosition:1005];
    [_actionViewLabel.layer setZPosition:1009];
    [spinner stopAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)increaseQuantityButtonTapped:(id)sender {
    UIButton* button  = (UIButton*)sender;
    if (button.tag==1) {
        iphone=iphone+1;
        [_iphoneQty setText:[NSString stringWithFormat:@"%02d",iphone]];
        
    }else if (button.tag==2){
        book=book+1;
        [_stealLikeBookQty setText:[NSString stringWithFormat:@"%02d",book]];
    }else{
        nikon=nikon+1;
        [_nikonCamQty setText:[NSString stringWithFormat:@"%02d",nikon]];
    }
    float subTotal  = iphone*iphoneRate +bookRate* book + nikonRate * nikon;
    float total = subTotal+10.0f;
    [_subTotal setText:[NSString stringWithFormat:@"$%.02f",subTotal]];
    [_totalLabel setText:[NSString stringWithFormat:@"$%.02f",total]];
    [_badgeLabel setText:[NSString stringWithFormat:@"%d",iphone+nikon+book]];
    [_shippingAmountLabel setText:@"$10"];
    [_badgeLabel setHidden:FALSE];
    
}
- (IBAction)decreaseQuantityButtonTapped:(id)sender {
    UIButton* button  = (UIButton*)sender;
    if (button.tag==1) {
        if (iphone==0) {
            return;
        }
        iphone=iphone-1;
        [_iphoneQty setText:[NSString stringWithFormat:@"%02d",iphone]];
    }else if (button.tag==2){
        if (book==0) {
            return;
        }
        book=book-1;
        [_stealLikeBookQty setText:[NSString stringWithFormat:@"%02d",book]];
    }else{
        if (nikon==0) {
            return;
        }
        nikon=nikon-1;
        [_nikonCamQty setText:[NSString stringWithFormat:@"%02d",nikon]];
        
    }
    float subTotal  = iphone*iphoneRate +bookRate* book + nikonRate * nikon;
    float total = subTotal+10.0f;
    [_subTotal setText:[NSString stringWithFormat:@"$%.02f",subTotal]];
    
    [_badgeLabel setText:[NSString stringWithFormat:@"%d",iphone+nikon+book]];
    if (iphone+book+nikon == 0) {
        [_shippingAmountLabel setText:@"$0"];
        total=0.0f;
        [_badgeLabel setHidden:YES];
    }
    [_totalLabel setText:[NSString stringWithFormat:@"$%.02f",total]];
    
}
- (IBAction)showProfileView:(id)sender {
    Profile2ViewController* profileView2 = [[Profile2ViewController alloc] init];
    [self presentViewController:profileView2 animated:NO completion:nil];
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
